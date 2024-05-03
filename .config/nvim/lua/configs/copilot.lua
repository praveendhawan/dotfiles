local node_path = vim.fn.system("asdf where nodejs 20.5.0"):gsub("\n", "")
node_path = node_path .. "/bin/node"

require("copilot").setup {
  copilot_node_command = node_path,
  filetypes = {
    ruby = true,
    erb = true,
    javascript = true,
    typescript = true,
  },
  suggestion = { enabled = false },
  panel = { enabled = false },
}
