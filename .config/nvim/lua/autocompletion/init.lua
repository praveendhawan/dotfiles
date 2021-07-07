vim.o.completeopt = "menuone,noinsert,noselect"
-- vim.o.shortmess = vim.o.shortmess + c
vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy', 'all' }
vim.g.completion_matching_smart_case = 1
vim.g.completion_trigger_character = { '.', '::' }

-- require'compe'.setup {
--   enabled = true;
--   autocomplete = true;
--   debug = false;
--   min_length = 2;
--   preselect = 'enable';
--   throttle_time = 80;
--   source_timeout = 200;
--   resolve_timeout = 800;
--   incomplete_delay = 400;
--   max_abbr_width = 100;
--   max_kind_width = 100;
--   max_menu_width = 100;
--   documentation = {
--     border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--     winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
--     max_width = 120,
--     min_width = 60,
--     max_height = math.floor(vim.o.lines * 0.3),
--     min_height = 1,
--   };

--   source = {
--     path = true;
--     nvim_lsp = true;
--     -- buffer = true;
--     -- ultisnips = true;
--     -- tags = true;
--     -- nvim_treesitter = true;
--   };
-- }
