require('telescope').setup({
  extensions = {
    dash = {
      file_type_keywords = {
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
      },
    }
  }
})
