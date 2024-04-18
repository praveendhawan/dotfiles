require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt ='both' -- to enable cursorline!
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"

-- g.loaded_ruby_provider = 1 -- load ruby provider

-- g.ruby_host_prog = "asdf which neovim-ruby-host"
