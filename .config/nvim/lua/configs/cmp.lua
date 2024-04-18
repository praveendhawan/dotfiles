local M = {}

M.opts_overrides = {
  sources = {
    { name = "copilot" },
    { name = 'cmp_ai' },
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- Installed by NvChad
    { name = "buffer" }, -- 
    { name = "nvim_lua" },
    -- { name = "path" },
    { name = "treesitter" }
  }
}

M.cmp_ai_setup = function()
  local cmp_ai = require('cmp_ai.config')

  cmp_ai:setup({
    max_lines = 100,
    provider = 'Ollama',
    provider_options = {
      model = 'codegemma:7b-instruct-q5_K_M',
    },
    notify = true,
    notify_callback = function(msg)
      vim.notify(msg)
    end,
    run_on_every_keystroke = true,
    ignored_file_types = {
    },
  })
end

return M
