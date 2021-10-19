require'nvim-tree'.setup {
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = false,
  -- hijacks new directory buffers when they are opened.
  update_to_buf_dir   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = false,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = true
}

vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'build', '.cache', 'public', 'coc' } -- Dont show these folders or files in tree
vim.g.nvim_tree_git_hl = 1 -- Highlight files for git attributes
vim.g.nvim_tree_highlight_opened_files = 1 -- Enable folder and file icon highlight for opened files/directories
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0 }
