require'lspconfig'.solargraph.setup{
  settings = {
    solargraph = {
      diagnostics = false,
      completion = true
    }
  },
  on_attach = require'completion'.on_attach
}
