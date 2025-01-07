local node_path = vim.fn.system("mise which node"):gsub("\n", "")
-- node_path = node_path .. "/bin/node"

require("copilot").setup {
  copilot_node_command = node_path,
  filetypes = {
    ruby = true,
    javascript = true,
    typescript = true,
    lua = true,
    journal = false,
    ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
  },
  suggestion = { enabled = false },
  panel = { enabled = false },
}
