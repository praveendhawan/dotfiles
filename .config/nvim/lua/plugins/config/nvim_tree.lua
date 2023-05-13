require'nvim-tree'.setup {
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  -- auto_close          = false,
  -- hijacks new directory buffers when they are opened.
  hijack_directories   = {
    -- enable the feature
    enable = true,
    -- allow to open the tree if it was previously closed
    auto_open = false,
  },
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = true,
  -- filtering options
  filters = {
    -- do show `dotfiles` (files starting with a `.`)
    dotfiles = false,
    custom = {
      '.git',
      'node_modules',
      'build',
      '.cache',
      'public',
      'coc',
      '.vscode'
    } -- Dont show these folders or files in tree
  },
  -- Git filtering - enabled by default
  git = {
    -- show git ignore files
    ignore = false,

  },
  --  Disable Netrw
  disable_netrw = true,
}

vim.g.nvim_tree_git_hl = 1 -- Highlight files for git attributes
vim.g.nvim_tree_highlight_opened_files = 1 -- Enable folder and file icon highlight for opened files/directories
vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 1, folder_arrows = 0 }
