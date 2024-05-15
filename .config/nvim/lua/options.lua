require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt = "both" -- to enable cursorline!
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"
