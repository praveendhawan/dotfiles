local ls = require "luasnip"

-- Reuse ruby snippets in rails files
ls.filetype_extend("ruby", { "rails" })
-- Reuse css snippets in scss files
ls.filetype_extend("css", { "scss" })
-- Reuse javascript snippets in vue files
ls.filetype_extend("javascript", { "vue" })
-- Reuse javascript snippets in coffee files
ls.filetype_extend("javascript", { "coffee" })
