require "nvchad.options"

-- add yours here!

local o = vim.o
local g = vim.g
o.cursorlineopt = "both" -- to enable cursorline!
-- g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"

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

-- Augment Code
g.augment_workspace_folders = {
  "~/workspace/Office/spree-jiffyshirts",
}

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Add custom Filetypes based on extensions
vim.filetype.add({
  pattern = {
    ['.*alias.*'] = 'sh',
  },
})
