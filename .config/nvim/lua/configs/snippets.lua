local ls = require "luasnip"

-- some shorthands...
local s = ls.snippet
--local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
local c = ls.choice_node
-- local d = ls.dynamic_node
--
-- Snip Create Guide
-- 1. Special char doesnt work - like \n
--    To do this have multiple strings in text_node
--    like t({ '', ' yo' }) = "\n yo"
-- 2. Jumplist starts from 1...n jumpable by tab
--    0 is exit node, it doesnt support placeholder
-- 3. Reuse snippets of one language to another
--    ls.snippets.scss = ls.snippets.css
--    This should be done after the snippets are defined

ls.add_snippets("all", {
  -- todo
  s({ trig = "todo" }, { t "TODO: " }),
  s({ trig = "fixme" }, { t "FIXME: " }),
  s({ trig = "note" }, { t "NOTE: " }),
})

ls.add_snippets("lua", {
  -- function
  s({ trig = "fun" }, {
    t "function ",
    i(1, "function_name"),
    t { "()", "  " },
    i(0),
    t { "", "end" },
  }),
})

ls.add_snippets("ruby", {
  s({ trig = "fsl" }, { t { "# frozen_string_literal: true", "" } }),
  s({ trig = "bye" }, { t { "byebug" } }),
  s({ trig = "bug" }, { t { "byebug" } }),
  s({ trig = "pry" }, { t { "binding.pry" } }),
  s({ trig = "bin" }, { t { "binding.pry" } }),
  -- attr_reader :JP1
  s({ trig = "atrr" }, {
    t "attr_reader :",
    i(1, "attribute_name"),
    i(0),
  }),
  -- attr_accessor :JP1
  s({ trig = "atra" }, {
    t "attr_accessor :",
    i(1, "attribute_name"),
    i(0),
  }),
  -- attr_accessor :JP1
  s({ trig = "atrw" }, {
    t "attr_writer :",
    i(1, "attribute_name"),
    i(0),
  }),
  -- Connection execute
  s({ trig = "conne" }, {
    t "ActiveRecord::Base.connection.",
    c(1, {
      t "execute(",
      t "select_values(",
      t "select_rows(",
      t "select_value(",
    }),
    i(2, "raw_sql_string"),
    t ")",
    i(0),
  }),
  -- Transaction
  s({ trig = "trans" }, {
    t { "ActiveRecord::Base.transaction do", "  " },
    i(0),
    t "end",
  }),
  -- progress bar
  s({ trig = "bar" }, {
    t "bar = ProgressBar.new(",
    i(0, "count"),
    t ")",
  }),
})

ls.add_snippets("ledger", {
  -- Transaction
  s({ trig = "new" }, {
    t "2021/01/01 * ",
    i(1, "payee"),
    t " ",
    i(2, "narration"),
    t " ",
    i(3, "amount"),
    t " ",
    i(0),
  }),
})

ls.filetype_extend("ruby", { "rails" })

-- Reuse css snippets in scss files
ls.filetype_extend("css", { "scss" })
-- Reuse javascript snippets in vue files
ls.filetype_extend("javascript", { "vue" })
-- Reuse javascript snippets in coffee files
ls.filetype_extend("javascript", { "coffee" })
