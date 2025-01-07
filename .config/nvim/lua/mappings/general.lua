local map = vim.keymap.set
local nomap = vim.keymap.del

-- Copy Full File path to system clipboard
map("n", "<leader>rf", ":let @+=expand('%:p')<CR>", { desc = "Files - Copy absolute path" })
-- Copy File path relative to current directory
map("n", "<leader>rr", ":let @+=expand('%:p:.')<CR>", { desc = "Files - Copy relative path" })
-- Copy just file name to system clipboard
map("n", "<leader>rc", ':let @+=expand("%:t")<cr>', { desc = "Files - Copy file name" })

map(
  "ca", -- ca means abbreviation in command line mode, ia for insert abbv, and !a for both
  "bda",
  function()
    require("nvchad.tabufline").closeAllBufs()
  end,
  { desc = "Files - Close All Buffers", noremap = true, silent = true }
)
map(
  "ca", -- ca means abbreviation in command line mode, ia for insert abbv, and !a for both
  "bca",
  function()
    require("nvchad.tabufline").closeAllBufs(false)
  end,
  { desc = "Files - Close All Except Current Buffers", noremap = true, silent = true }
)

-- Delete mappings
-- nomap("n", ";")
-- nomap("i", "jk")
nomap("n", "<leader>x")
