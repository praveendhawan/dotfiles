local utils = {
  lspconfig = require('lspconfig')
}

-- For Snippets Support
local capabilities = require('cmp_nvim_lsp').default_capabilities()

function utils.on_attach(_client, _)
  -- utils.lsp_status.on_attach(client)
end

utils.common_config = {
  capabilities = capabilities, -- vim.tbl_extend('keep', capabilities or {}, utils.lsp_status.capabilities),
  flags = {
    debounce_text_changes = 150,
  }
}

return utils
