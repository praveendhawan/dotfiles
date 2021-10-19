local utils = {
  lspconfig = require('lspconfig'),
}

-- For Snippets Support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

function utils.lsp_status_progress()
  -- utils.lsp_status.register_progress()
end

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
