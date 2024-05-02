return {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-H",
    },
    file_ignore_patterns = {
      "node_modules/.*",
      "build/.",
      ".git/.*",
      "tmp/cache/.*",
      "public/.*",
      "vendor/.*",
      "docs/.*",
      "*.log",
      "storage/.*",
      "tags/.*",
    },
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
