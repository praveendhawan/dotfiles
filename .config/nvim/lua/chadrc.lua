-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local highlights = require "highlights"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "material-darker",

  hl_override = highlights.override,
  hl_add = highlights.add,
  nvdash = {
    load_on_startup = true,
  },
}

return M
