local helix = require('helix')

local function find_git_root()
    local current_dir = helix.lsp.workspace.root()
    local git_root = helix.utils.get_output("cd " .. current_dir .. " && git rev-parse --show-toplevel")
    return git_root
end

local function get_github_url(remote_url, branch, rel_path)
    local user, repo = remote_url:match('^git@github.com:(.+)/(.+)%.git$')
    if not user or not repo then return nil end

    local github_url = string.format('https://github.com/%s/%s/blob/%s/%s', user, repo, branch, rel_path)
    return github_url
end

local function open_on_github()
    local remote_url = helix.utils.get_output('git config --get remote.origin.url')
    local git_root = find_git_root()
    if git_root == '' then
        helix.core.echo("Not a Git repository")
        return
    end

    local rel_path = helix.buffer.name():sub(#git_root + 2)
    local branch = helix.utils.get_output('git symbolic-ref --short HEAD')
    local github_url = get_github_url(remote_url, branch, rel_path)
    if not github_url then
        helix.core.echo("Not a GitHub repository")
        return
    end

    -- Copy GitHub URL to the system clipboard
    helix.utils.set_clipboard(github_url)
    helix.core.echo("GitHub URL copied to clipboard: " .. github_url)
end

return {
    open_on_github = open_on_github
}