local ls = require("luasnip")
local parser = ls.parser.parse_snippet()

-- some shorthands...
--local s = ls.snippet
-- local sn = ls.snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node

ls.snippets = {
  all = {
    -- todo
    parser({ trig = "todo" }, "TODO: ${1:todo}"),
    parser({ trig = "fixme" }, "FIXME: ${1:fixme}"),
    parser({ trig = "note" }, "NOTE: ${1:note}")
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
    parser({ trig = 'fsl' }, "# frozen_string_literal: true"),
    parser({ trig = 'all' }, "all? { |${1:var}| ${0:body} }"),
    parser({ trig = 'any' }, "any? { |${1:var}| ${0:body} }"),
    parser({ trig = 'map' }, "map { |${1:var}| ${0:body} }"),
    parser({ trig = 'ali' }, "alias_method :${1:new_name}, :${0:old_name}"),
    parser({ trig = 'attrr' }, "attr_reader ${0:attributes}"),
    parser({ trig = 'attra' }, "attr_accessor ${0:attributes}"),
    parser({ trig = 'attra' }, "attr_writer ${0:attributes}"),
    parser({ trig = 'req' }, "require '${0:module_name}'"),
    parser({ trig = 'reqr' }, "require_relative '${0:module_name}'"),
    parser({ trig = 'conne' }, "ActiveRecord::Base::Connection.execute(${0:raw_sql_string})"),
    parser({ trig = 'trans' },
      [[
        ActiveRecord::Base.transaction do
          ${0}
        end
      ]]
    ),
    parser({ trig = 'cla' },
      [[
        class ${2:class_name}
          def initialize(${1:args})
            ${0}
          end
        end
      ]]
    ),
    parser({ trig = 'mod' },
      [[
        module ${3:module_name}
          def ${2:method_name}(${1:args})
            ${0}
          end
        end
      ]]
    ),
    parser({ trig = 'def' },
      [[
        def ${2:method_name}(${1:args})
          ${0}
        end
      ]]
    ),
    parser({ trig = 'bar' },
      [[
        bar = ProgressBar.new(${0:count})
      ]]
    ),
  }
}
