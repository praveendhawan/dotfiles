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
    -- ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<c-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
    -- ["Up"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    -- ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<c-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
    -- ["Down"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
    ["<c-d>"] = cmp.mapping.scroll_docs(-4),
    ["<c-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-space>"] = cmp.mapping.complete(),
    ["<c-e>"] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      menu = ({
        buffer                   = "[B]",
        cmdline                  = "[Cmd]",
        copilot                  = "[Cop]",
        luasnip                  = "[Snip]",
        nvim_lsp                 = "[LSP]",
        nvim_lsp_document_symbol = "[LSP-DS]",
        nvim_lsp_signature_help  = "[Sig]",
        nvim_lua                 = "[Lua]",
        path                     = "[P]",
        tags                     = "[Tag]",
        treesitter               = "[TS]",
      })
    }),
  },
  sources = {
    { name = 'path', priority = 1 },
    -- { name = 'calc' },
    { name = 'luasnip', priority = 2 },
    { name = 'treesitter', priority = 3 },
    { name = 'nvim_lsp', priority = 4 },
    { name = 'copilot', priority = 5 },
    { name = 'nvim_lsp_signature_help', priority = 6 },
    -- { name = 'buffer' },
    { name = 'tags', priority = 5, max_item_count = 7 },
    -- { name = 'spell' },
  }
}

--  Enable nvim lua source only for lua files
cmp.setup.filetype('lua', {
  sources = cmp.config.sources({
    { name = 'nvim_lua', priority = 8 },
  })
})

-- Setup for vim search using /
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' }
  }
})

-- Setup for CMD mode using ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

