require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt = "both" -- to enable cursorline!
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"

-- Need to enable Ruby as it is off by default in Nvchad
-- https://github.com/NvChad/NvChad/issues/1417#issuecomment-1203490842
local enable_providers = {
  "ruby_provider",
}

for _, plugin in pairs(enable_providers) do
  g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
