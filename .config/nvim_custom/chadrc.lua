---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  tabufline = {
    show_numbers = true
  }
}

M.plugins = "custom.plugins"

-- M.functions = require "custom.functions"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
