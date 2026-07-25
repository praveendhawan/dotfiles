local progress_handler = vim.lsp.handlers["$/progress"]
vim.lsp.handlers["$/progress"] = function(err, params, ctx, config)
  if type(params.value) == "table" and params.value.percentage == vim.NIL then
    params.value.percentage = nil
  end
  return progress_handler(err, params, ctx, config)
end

local servers = { "zls", "ty", "rust_analyzer", "ruby_lsp", "elixirls" }
vim.lsp.enable(servers)
