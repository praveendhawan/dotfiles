require('telescope').setup({
  extensions = {
    dash = {
      file_type_keywords = {
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        ruby = { 'ror', 'ruby 2', 'jiffy', 'solidus' },
        javascript = { 'js' },
        typescript = { 'js' },
        rust = { 'rs' },
        elixir = { 'ex', 'eex' },
      },
    }
  }
})
