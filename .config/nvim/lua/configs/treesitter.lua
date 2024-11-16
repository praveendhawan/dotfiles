local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.d2 = {
  install_info = {
    url = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2",
    revision = "main",
    files = { "src/parser.c", "src/scanner.c" },
  },
  filetype = "d2",
}

return {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    -- "c",
    "markdown",
    "markdown_inline",
    "ruby",
    "rust",
    "elixir",
    "json",
    "ledger",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  -- highlight = {
  --   enable = true,
  -- },
  incremental_selection = {
    enable = true,
  },
}
