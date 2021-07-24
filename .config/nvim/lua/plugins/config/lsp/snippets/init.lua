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

ls.snippets = {
  all = {
    -- todo
    s({ trig = "todo" }, t("TODO: ")),
    s({ trig = "fixme" }, t("FIXME: ")),
    s({ trig = "note" }, t("NOTE: "))
  },
  lua = {
    -- function
    parser(
      { trig = 'fun' },
      [[
        function $1()
          $0
        end
      ]]
    )
  },
  ruby = {
    s({ trig = 'fsl' }, t("# frozen_string_literal: true")),
    -- all? { |JP1| JP2 }
    s({ trig = 'all' },
      t("all? { |"), i(1),
      t("| "), i(0),
      t("}")
    ),
    -- any? { |JP1| JP2 }
    s({ trig = 'any' },
      t("any? { |"), i(1),
      t("| "), i(0),
      t("}")
    ),
    -- map { |JP1| JP2 }
    s({ trig = 'map' },
      t("map { |"), i(1),
      t("| "), i(0),
      t("}")
    ),
    -- alias_method :JP1, :JP2
    s({ trig = 'ali' },
      t("alias_method :"), i(1, "new_name"),
      t(", :"), i(0, "old_name")
    ),
    -- attr_reader :JP1
    s({ trig = 'attrr' },
      t("attr_reader :"), i(1, "attribute_name")
    ),
    -- attr_accessor :JP1
    s({ trig = 'attra' },
      t("attr_accessor :"), i(1, "attribute_name")
    ),
    -- attr_accessor :JP1
    s({ trig = 'attrw' },
      t("attr_writer :"), i(1, "attribute_name")
    ),
    -- require 'JP1'
    s({ trig = 'req' },
      t("require '"), i(1, "module_name"), t("'")
    ),
    -- require_relative 'JP1'
    s({ trig = 'reqr' },
      t("require_relative '"), i(1, "module_name"), t("'")
    ),
    -- Connection execute
    s({ trig = 'conne' },
      t("ActiveRecord::Base.connection."),
      c(2,
        t("execute("),
        t("select_values("),
        t("select_rows("),
        t("select_value(")
      ),
      i(1, "raw_sql_string"),
      t(")")
    ),
    -- Transaction
    s({ trig = 'trans'},
      t("ActiveRecord::Base.transaction do\n  "),
      i(0),
      t("end")
    ),
    -- Class
    s({ trig = 'cla'},
      t("class "),
      i(2, "ClassName"),
      t("\n  def initialize("),
      i(1, 'args'),
      t(')\n    '),
      i(0, 'body'),
      t('  end\nend')
    ),
    -- Module
    s({ trig = 'mod'},
      t("module "),
      i(3, "ModuleName"),
      t("\n  def "),
      i(2, "method_name"),
      t('('),
      i(1, 'args'),
      t(')\n    '),
      i(0, 'body'),
      t('  end\nend')
    ),
    -- def method
    s({ trig = 'def'},
      t("def "),
      i(2, "method_name"),
      t('('),
      i(1, 'args'),
      t(')\n  '),
      i(0, 'body'),
      t('  end')
    ),
    -- progress bar
    s({ trig = 'bar'},
      t("bar = ProgressBar.new("),
      i(0, 'count'),
      t(')')
    ),
  },
  css = {
    parser({ trig = 'pad', name = 'padding'}, "padding: ${0:0};"),
    parser({ trig = 'mar', name = 'margin'}, "margin: ${0:0};"),
    parser({ trig = 'bor', name = 'border'}, "border: ${0:0};"),
    parser({ trig = 'dis', name = 'display'}, "display: ${0:none};"),
    parser({ trig = 'back', name = 'background'}, "background: ${0:none};"),
    parser({ trig = 'fon', name = 'font-family'}, "font-family: ${1:'Arial'};"),
    parser({ trig = 'hei', name = 'height'}, "height: ${0:auto};"),
    parser({ trig = 'wid', name = 'width'}, "width: ${0:auto};"),
    parser({ trig = 'pos', name = 'position'}, "position: ${0:relative};"),
    parser({ trig = 'imp', name = '!important'}, "!important $0"),
  },
  javascript = {
    parser({ trig = 'con', name = 'console'}, "console.log(${0:'hi'});"),
    parser({ trig = 'log', name = 'console'}, "console.log(${0:'hi'});"),
    parser({ trig = 'ale', name = 'alert'}, "alert(${0:'hi'});"),
    parser({ trig = 'func', name = 'function'},
      [[
        function ${2:function_name} (${1:function_args}) {
          $0
        }
      ]]
    ),
  }
}
