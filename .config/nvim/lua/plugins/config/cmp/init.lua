vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.shortmess:append "c"
-- For spell source
-- vim.opt.spell = true
-- vim.opt.spelllang = { 'en_us' }

local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
  snippet = {
    expand = function(args)
      require'luasnip'.lsp_expand(args.body)
    end
  },
  completion = {
    -- The minimum length of a word to complete on
    keyword_length = 3
  },
  mapping = {
    ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["Up"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["Down"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<c-d>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = lspkind.cmp_format(),
  },
  sources = {
    { name = 'path', priority = 1 },
    -- { name = 'calc' },
    { name = 'luasnip', priority = 2 },
    { name = 'treesitter', priority = 3 },
    { name = 'nvim_lsp', priority = 4 },
    -- { name = 'buffer' },
    { name = 'tags', priority = 5, max_item_count = 5 },
    -- { name = 'spell' },
    { name = 'nvim_lua', priority = 6 },
  }
}
