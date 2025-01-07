-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local highlights = require "highlights"

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = highlights.override,
  hl_add = highlights.add,
  theme_toggle = { "catppuccin", "nightlamp" },
}

M.ui = {
  nvdash = {
    load_on_startup = true,
  },
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  tabufline = {
    lazyload = false,
    order = { "treeOffset", "buffers", "btns" },
  },
}

return M
