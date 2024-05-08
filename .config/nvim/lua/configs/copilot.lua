local node_path = vim.fn.system("asdf where nodejs 20.5.0"):gsub("\n", "")
node_path = node_path .. "/bin/node"

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
