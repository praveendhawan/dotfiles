function FindGitRoot()
  -- Determine the root of the Git repository
  local git_root = vim.fn.trim(
    vim.fn.system(
      string.format(
        'cd %q && git rev-parse --show-toplevel',
        vim.fn.expand('%:p:h')
      )
    )
  )

  return git_root
end

function GetGithubURL(remote_url, branch, rel_path)
  -- Extract user and repo from GitHub remote URL
  local pattern = '^git@github.com:(.+)/(.+)%.git$'
  local user, repo = remote_url:match(pattern)
  if not user or not repo then return nil end

  -- Construct URL to file on GitHub
  local github_url = string.format(
    'https://github.com/%s/%s/blob/%s/%s',
    user, repo, branch, rel_path
  )
  return github_url
end

function OpenOnGithub()
  -- Extract remote URL from git config
  local remote_url = vim.fn.trim(vim.fn.system('git config --get remote.origin.url'))

  -- Get the Git root directory
  local git_root = FindGitRoot()
  if git_root == '' then
    print('Not a Git repository')
    return
  end

  -- Check if remote URL is a GitHub URL
  local rel_path = vim.fn.expand('%:p'):sub(#git_root + 2)
  local branch = vim.fn.trim(vim.fn.system('git symbolic-ref --short HEAD'))
  local github_url = GetGithubURL(remote_url, branch, rel_path)
  if not github_url then
    print('Not a GitHub repository')
    return
  end
  -- Copy GitHub URL to register
  vim.fn.OSCYankString(github_url)
end

-- Register command
vim.cmd('command! OpenOnGithub lua OpenOnGithub()')

-- Create keybinding
vim.api.nvim_set_keymap('n', '<leader>og', ':OpenOnGithub<CR>', { noremap = true })
