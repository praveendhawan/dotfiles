local map = vim.keymap.set
map("n", "<leader>s", ":TSJToggle<CR>", { desc = "SJ - Split and Join block", noremap = true })

map("n", "<leader>tn", ":TestNearest<CR>", { desc = "Test Nearest", silent = true })
map("n", "<leader>tf", ":TestFile<CR>", { desc = "Test File", silent = true })

map("n", "<leader>gb", ":Gitsigns blame <CR>", { desc = "Git - Toggle git blame", noremap = true })

-- Show prompts actions with telescope
-- map("n", "<leader>cc", function()
--   local actions = require "CopilotChat.actions"
--   require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
-- end, { desc = "Copilot Chat - Prompts", noremap = true })
-- Use CodeCompanionChat
map({"n", "v"}, "<Leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat Toggle", noremap = true, silent = true })
map({"n", "v"}, "<Leader>ca", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions", noremap = true, silent = true })
map("v", "<Leader>cv", "<cmd>CodeCompanionChat Add<cr>", { desc = "AI Chat Add selection", noremap = true, silent = true })

if vim.fn.has "mac" == 1 then
  map("n", "<Leader>og", ":OpenInGHFileLines! <CR>", { desc = "Github - Open Current Line" })
else
  map("n", "<Leader>og", ":OpenInGHFileLines+ <CR>", { desc = "GIthub - Copy Current Line URL" })
end
