require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt = "both" -- to enable cursorline!
g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"

-- Folding
-- Use treesitter for folding
-- o.foldmethod = "expr"
-- o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- --
o.foldcolumn = "1"
-- -- By setting this to an empty string, it means that the first line of the fold will be syntax highlighted, rather than all be one colour.
-- -- o.foldtext = "" -- Only in nightly
-- -- Setting foldlevel sets the minimum level of a fold that will be
-- -- closed by default.
o.foldlevel = 99
-- -- use foldlevelstart to dicate upon editing a buffer what level of
-- -- folds should be open by default vs close
o.foldlevelstart = 99
-- -- This limits how deeply code gets folded
-- o.foldnestmax = 10

-- OSC52 clipboard config
-- osc52 is provided by default in neovim 0.10
if os.getenv "SSH_CLIENT" ~= nil then
  local osc52 = require "vim.ui.clipboard.osc52"

  g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy "+",
      ["*"] = osc52.copy "*",
    },
    paste = {
      ["+"] = osc52.paste "+",
      ["*"] = osc52.paste "*",
    },
  }
end
