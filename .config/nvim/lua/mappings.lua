require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del
-- add yours here
-- Copy Full File path to system clipboard
map("n", "<leader>rf", ":let @+=expand('%:p')<CR>", { desc = "Files - Copy absolute path" })
-- Copy File path relative to current directory
map("n", "<leader>rr", ":let @+=expand('%:p:.')<CR>", { desc = "Files - Copy relative path" })
-- Copy just file name to system clipboard
map("n", "<leader>rc", ':let @+=expand("%:t")<cr>', { desc = "Files - Copy file name" })
-- Ctree
-- ["<leader>ct"] = {
--   function()
--     custom_functions.ctree_builder(vim.fn.expand('%:p:.:h'))
--   end,
--   'Build Component tree'
-- }
--   }
-- }
map("n", "<leader>s", ":TSJToggle<CR>", { desc = "SJ - Split and Join block", noremap = true })

map("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test Nearest", silent = true })
map("n", "<leader>tf", ":TestFile<CR>", { desc = "Test File", silent = true })

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
  "<leader>gb",
  "<cmd> Gitsigns toggle_current_line_blame <CR>",
  { desc = "Git - Toggle git blame", noremap = true }
)

-- Show prompts actions with telescope
map("n", "<leader>tgp", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "Copilot Chat - Prompts", noremap = true })

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

if vim.fn.has "mac" == 1 then
  map("n", "<Leader>og", ":OpenInGHFileLines! <CR>", { desc = "Github - Open Current Line" })
else
  map("n", "<Leader>og", ":OpenInGHFileLines+ <CR>", { desc = "GIthub - Copy Current Line URL" })
end

-- Delete mappings
-- nomap("n", ";")
-- nomap("i", "jk")
nomap("n", "<leader>x")
