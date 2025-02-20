vim.tbl_map(function(type)
  require("luasnip.loaders.from_" .. type).lazy_load()
end, { "vscode", "snipmate", "lua" })

-- Reuse ruby snippets in rails files
require("luasnip").filetype_extend("ruby", { "rdoc" })
require("luasnip").filetype_extend("ruby", { "rails" })
-- Reuse css snippets in scss files
require("luasnip").filetype_extend("css", { "scss" })
-- Reuse javascript snippets in vue files
require("luasnip").filetype_extend("javascript", { "vue" })
-- Reuse javascript snippets in coffee files
require("luasnip").filetype_extend("javascript", { "coffee" })
