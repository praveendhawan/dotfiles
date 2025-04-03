local telescopeConfig = require "telescope.config"

local vimgrep_arguments = telescopeConfig.values.vimgrep_arguments

table.insert(vimgrep_arguments, "--follow") -- -L => follow symbolic links
table.insert(vimgrep_arguments, "--trim") -- trim the indentation at the beginning of presented line

local file_ignore_patterns = {
  "node_modules/.*",
  "build/.",
  ".git/.*",
  ".github/",
  ".yardoc/",
  "tmp/cache/.*",
  "public/.*",
  "vendor/.*",
  "docs/.*",
  "*.log",
  "storage/.*",
  "tags/.*",
}

-- local find_file_ignore_patterns = ""
--
-- for _, pattern in ipairs(file_ignore_patterns) do
--   find_file_ignore_patterns = find_file_ignore_patterns .. "-g !**" .. pattern
-- end
--
local path_display_opts = {
  filename_first = {
    reverse_directories = false,
  },
  shorten = {
    len = 4,
  },
}

local delete_marks = function(prompt_bufnr, map)
  map({ "i", "n" }, "<C-d>", function()
    require("telescope.actions").delete_mark(prompt_bufnr)
  end)
  return true -- Keep default mappings as well as the custom ones
end

return {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    file_ignore_patterns = file_ignore_patterns,
  },
  pickers = {
    find_files = {
      previewer = false,
      wrap_results = true,
      path_display = path_display_opts,
    },
    git_files = { path_display = path_display_opts },
    grep_string = { path_display = path_display_opts },
    live_grep = { path_display = path_display_opts },
    buffers = { path_display = path_display_opts },
    oldfiles = { path_display = path_display_opts },
    marks = { attach_mappings = delete_marks },
  },
  extensions_list = { "themes", "terms", "fzf", "ui-select" },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "ignore_case", -- or "smart_case" or "respect_case"
    },
  },
}
