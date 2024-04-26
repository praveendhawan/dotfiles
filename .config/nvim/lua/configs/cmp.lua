local M = {}

local hide_text_lsp = function (entry, _)
  return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
end

-- local cmp = require("cmp")

M.opts_overrides = {
  sources = {
    -- group_index => kind of source priority, see :h cmp-config.sources[n].group_index
    -- entry_filter => hide certain entries from given source
    { name = "luasnip", group_index = 1 }, -- Installed by NvChad
    { name = "nvim_lua", group_index = 1 },
    -- hide entries of Text Kind from LSP
    { name = "nvim_lsp", group_index = 2, entry_filter = hide_text_lsp },
    { name = "treesitter", group_index = 2 },
    { name = "copilot", grpup_index = 3 },
    -- { name = 'cmp_ai', group_index = 3 },
    { name = "buffer", group_index = 4 },
    { name = "path", group_index = 4 },
  },
  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     cmp.config.compare.exact,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.score,
  --     require("copilot_cmp.comparators").prioritize,
  --
  --     -- Below is the default comparitor list and order for nvim-cmp
  --     cmp.config.compare.offset,
  --     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.locality,
  --     -- cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- },
}

-- M.cmp_ai_setup = function()
--   local cmp_ai = require('cmp_ai.config')
--
--   cmp_ai:setup({
--     max_lines = 100,
--     provider = 'Ollama',
--     provider_options = {
--       model = 'llama3:instruct',
--     },
--     notify = true,
--     notify_callback = function(msg)
--       vim.notify(msg)
--     end,
--     run_on_every_keystroke = true,
--     ignored_file_types = {
--     },
--   })
-- end

return M
