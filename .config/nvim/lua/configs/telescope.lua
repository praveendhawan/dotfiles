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
return {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    file_ignore_patterns = file_ignore_patterns,
  },
  pickers = {
    find_files = {
      previewer = false,
      wrap_results = true,
      path_display = { shorten = { len = 4 } },
    },
  },
  extensions_list = { "themes", "terms", "fzf", "ui-select" },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}
