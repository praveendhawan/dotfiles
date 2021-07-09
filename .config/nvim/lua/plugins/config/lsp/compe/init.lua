vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.shortmess:append "c"

-- vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy', 'all' }
-- vim.g.completion_matching_smart_case = 1
-- vim.g.completion_trigger_character = { '.', '::' }

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  resolve_timeout = 800,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = { kind = "   (Path)" },
    buffer = { kind = "   (Buffer)" },
    calc = { kind = "   (Calc)" },
    -- vsnip = { kind = "   (Snippet)" },
    nvim_lsp = { kind = "   (LSP)" },
    -- nvim_lua = {kind = "  "},
    -- nvim_lua = false,
    spell = { kind = "   (Spell)" },
    -- tags = false,
    -- vim_dadbod_completion = true,
    -- snippets_nvim = {kind = "  "},
    -- ultisnips = {kind = "  "},
    treesitter = {kind = "  "},
    emoji = { kind = " ﲃ  (Emoji)", filetypes = { "markdown", "text" } },
    -- for emoji press : (idk if that in compe tho)
  },
}
