local map = vim.keymap.set

map("n", "<leader>md", function()
  require("menu").open "default"
end, { desc = "Menu - Default" })

map("n", "<leader>mg", function()
  require("menu").open "gitsigns"
end, { desc = "Menu - Default" })

map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, { desc = "Menu - Default/Nvimtree" })
