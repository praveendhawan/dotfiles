require('telescope').setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--line-number',
      '--column',
      '--smart-case',
      '-H'
    },
    file_ignore_patterns = {
      "node_modules/.*",
      "build/.",
      ".git/.*",
      "tmp/cache/.*",
      "public/.*",
      "vendor/.*",
      "docs/.*",
      '*.log',
      "storage/.*",
      "tags/.*",
    },
  },
  pickers = {
    find_files = {
      previewer = false,
      theme = 'dropdown'
    },
    current_buffer_fuzzy_find = {
      theme = 'dropdown'
    },
    live_grep = {
      theme = 'dropdown'
    },
    buffers = {
      previewer = false,
      theme = 'dropdown'
    },
    help_tags = {
      theme = 'dropdown'
    },
    grep_string = {
      theme = 'dropdown'
    },
    keymaps = {
      theme = 'dropdown',
      previewer = false
    }
  }
}
