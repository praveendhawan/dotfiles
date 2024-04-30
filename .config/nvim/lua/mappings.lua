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

-- Show help actions with telescope
map("n", "<leader>tgh", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.help_actions())
end, { desc = "Copilot Chat - Help", noremap = true })
-- Show prompts actions with telescope
map("n", "<leader>tgp", function()
  local actions = require "CopilotChat.actions"
  require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "Copilot Chat - Prompts", noremap = true })
-- Quick chat full buffer context
map("n", "<leader>tgq", function()
  local input = vim.fn.input "Quick Chat: "
  if input ~= "" then
    require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
  end
end, { desc = "Copilot Chat - Full Buffer", noremap = true })
map("n", "<leader>tgr", ":CopilotChatReview", { desc = "Copilot Chat - Review selected", noremap = true })
map("n", "<leader>tge", ":CopilotChatExplain", { desc = "Copilot Chat - Explain selected", noremap = true })

map(
  "c",
  "bda<CR>",
  require("nvchad.tabufline").closeAllBufs,
  { desc = "Files - Close All Buffers", noremap = true, silent = true }
)
map(
  "c",
  "bca<CR>",
  require("nvchad.tabufline").closeOtherBufs,
  { desc = "Files - Close All Except Current Buffers", noremap = true, silent = true }
)

-- Delete mappings
-- nomap("n", ";")
-- nomap("i", "jk")
nomap("n", "<leader>x")
