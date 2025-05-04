local map = vim.keymap.set

map("n", "<leader>ft", "<cmd> Telescope treesitter <CR>", { desc = "Telescope Treesitter symbols", noremap = true })
map(
  "n",
  "<leader>fs",
  "<cmd> Telescope grep_string <CR>",
  { desc = "Telescope Find word under cursor", noremap = true }
)
map("n", "<leader>fm", "<cmd> Telescope marks <CR>", { desc = "Telescope Find vim marks", noremap = true })
map("n", "<leader>fr", "<cmd> Telescope resume <CR>", { desc = "Telescope Resume Previous", noremap = true })
map(
  "n",
  "<leader>fbf",
  "<cmd> Telescope current_buffer_fuzzy_find <CR>",
  { desc = "Telescope current buffer fuzzy find", noremap = true }
)
map("n", "<leader>fk", "<cmd> Telescope keymaps <CR>", { desc = "Telescope keymaps", noremap = true })
map(
  "n",
  "<leader>fl",
  "<cmd> Telescope lsp_workspace_symbols <CR>",
  { desc = "Telescope Find Workspace Symbols", noremap = true }
)
