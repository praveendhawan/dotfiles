local ls = require("luasnip")
local function parser(...)
  ls.parser.parse_snippet(...)
end

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
--    like t('', ' yo') = "\n yo"
-- 2. Jumplist starts from 1...n jumpable by tab
--    0 is exit node, it doesnt support placeholder
-- 3. Reuse snippets of one language to another
--    ls.snippets.scss = ls.snippets.css
--    This should be done after the snippets are defined

ls.snippets = {
  all = {
    -- todo
    s({ trig = "todo" }, { t("TODO: ") }),
    s({ trig = "fixme" }, { t("FIXME: ") }),
    s({ trig = "note" }, { t("NOTE: ") })
  },
  lua = {
    -- function
    s({ trig = 'fun' }, {
        t('function '),
        i(1, 'function_name'),
        t({ '()', '  ' }),
        i(0),
        t({ '', 'end' })
      }
    )
  },
  ruby = {
    s({ trig = 'fsl' }, { t("# frozen_string_literal: true") }),
    -- all? { |JP1| JP2 }
    s({ trig = 'all' }, {
        t("all? { |"), i(1, 'block_args'),
        t("| "), i(0),
        t("}")
      }
    ),
    -- any? { |JP1| JP2 }
    s({ trig = 'any' }, {
        t("any? { |"), i(1, 'block_args'),
        t("| "), i(0),
        t("}")
      }
    ),
    -- map { |JP1| JP2 }
    s({ trig = 'map' }, {
        t("map { |"), i(1, 'block_args'),
        t("| "), i(0),
        t("}")
      }
    ),
    -- alias_method :JP1, :JP2
    s({ trig = 'ali' }, {
        t("alias_method :"), i(1, "new_name"),
        t(", :"), i(2, 'old_name'), i(0)
      }
    ),
    -- attr_reader :JP1
    s({ trig = 'attrr' }, {
        t("attr_reader :"), i(1, "attribute_name"), i(0)
      }
    ),
    -- attr_accessor :JP1
    s({ trig = 'attra' }, {
        t("attr_accessor :"), i(1, "attribute_name"), i(0)
      }
    ),
    -- attr_accessor :JP1
    s({ trig = 'attrw' }, {
        t("attr_writer :"), i(1, "attribute_name"), i(0)
      }
    ),
    -- require 'JP1'
    s({ trig = 'req' }, {
        t("require '"), i(1, "module_name"), t("'"), i(0)
      }
    ),
    -- require_relative 'JP1'
    s({ trig = 'reqr' }, {
        t("require_relative '"), i(1, "module_name"), t("'"), i(0)
      }
    ),
    -- Connection execute
    s({ trig = 'conne' }, {
        t("ActiveRecord::Base.connection."),
        c(1, {
          t("execute("),
          t("select_values("),
          t("select_rows("),
          t("select_value(")
        }),
        i(2, "raw_sql_string"),
        t(")"),
        i(0)
      }
    ),
    -- Transaction
    s({ trig = 'trans'}, {
        t("ActiveRecord::Base.transaction do", '  '),
        i(0),
        t("end")
      }
    ),
    -- Class
    s({ trig = 'cla'}, {
        t("class "),
        i(1, "ClassName"),
        t('', "  def initialize("),
        i(2, 'args'),
        t(')', '    '),
        i(0),
        t('  end', 'end')
      }
    ),
    -- Module
    s({ trig = 'mod'}, {
        t("module "),
        i(1, "ModuleName"),
        t('', "  def "),
        i(2, "method_name"),
        t('('),
        i(3, 'args'),
        t(')', '    '),
        i(0),
        t('  end', 'end')
      }
    ),
    -- def method
    s({ trig = 'def'}, {
        t("def "),
        i(1, 'method_name'),
        t('('),
        i(2, 'args'),
        t({')', '  '}),
        i(0),
        t({'', 'end'})
      }
    ),
    -- progress bar
    s({ trig = 'bar'}, {
        t("bar = ProgressBar.new("),
        i(0, 'count'),
        t(')')
      }
    ),
  },
  css = {
    s({ trig = 'pad', name = 'padding'}, { t("padding: "), i(1, '0'), t(';'), i(0) }),
    s({ trig = 'mar', name = 'margin'}, { t("margin: "), i(1, '0'), t(';'), i(0) }),
    s({ trig = 'bor', name = 'border'}, { t("border: "), i(1, '0'), t(';'), i(0) }),
    s({ trig = 'dis', name = 'display'}, { t("display: "), i(1, 'none'), t(';'), i(0) }),
    s({ trig = 'bg', name = 'background'}, { t("background: "), i(1, 'none'), t(';'), i(0) }),
    s({ trig = 'fon', name = 'font-family'}, { t("font-family: "), i(1, 'Arial'), t(';'), i(0) }),
    s({ trig = 'hei', name = 'height'}, { t("height: "), i(1, 'auto'), t(';'), i(0) }),
    s({ trig = 'wid', name = 'width'}, { t("width: "), i(1, 'auto'), t(';'), i(0) }),
    s({ trig = 'pos', name = 'position'}, { t("position: "), i(1, 'relative'), t(';'), i(0) }),
    s({ trig = 'imp', name = 'important'}, { t("!important: "), i(0) }),
  },
  javascript = {
    s({ trig = 'con', name = 'log'}, { t('console.log('), i(1, 'hi'), t(');') }),
    s({ trig = 'log', name = 'log'}, { t('console.log('), i(1, 'hi'), t(');') }),
    s({ trig = 'ale', name = 'alert'}, { t('alert('), i(1, 'hi'), t(');') }),
    s({ trig = 'func', name = 'function'}, {
      t('function ('),
      i(1, 'function_name'),
      t('('),
      i(2, 'function_args'),
      t(') {', '  '),
      i(0),
      t('}')
    }),
  }
}
