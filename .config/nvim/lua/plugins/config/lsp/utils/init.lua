local utils = {
  lspconfig = require('lspconfig'),
  lsp_status = require('lsp-status'),
}

function utils.lsp_status_progress()
  utils.lsp_status.register_progress()
end

function utils.on_attach(client, _)
  utils.lsp_status.on_attach(client)
end

utils.common_config = {
  capabilities = vim.tbl_extend('keep', {}, utils.lsp_status.capabilities),
  flags = {
    debounce_text_changes = 150,
  }
}

return utils
