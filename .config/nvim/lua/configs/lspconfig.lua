-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local servers = { "html", "cssls" }
local servers = { "zls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
-- lspconfig.ts_ls.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- local solargraph_path = vim.fn.system("asdf which solargraph")

-- Ruby Server
-- Only setup solargraph if in jiffy
local current_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
if current_dir == "spree-jiffyshirts" then
  local server_options = {
    cmd = {
      "solargraph",
      "stdio",
    },
    capabilities = capabilities,
    on_init = on_init,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      formatting = false,
    },
    on_attach = on_attach,
    settings = {
      solargraph = {
        autoformat = false,
        checkGemVersion = true,
        completion = true,
        definitions = true,
        diagnostics = true,
        folding = false,
        formatting = false,
        hover = true,
        logLevel = "warn",
        references = true,
        rename = true,
        symbols = true,
        transport = "stdio",
        useBundler = false,
      },
    },
  }

  lspconfig.solargraph.setup(server_options)
end

-- Only setup ruby-lsp if not in jiffy
if current_dir ~= "spree-jiffyshirts" then
  local ruby_lsp_path = vim.fn.system("mise which ruby-lsp"):gsub("\n", "")
  local ruby_lsp_config = {
    cmd = { ruby_lsp_path },
  }

  lspconfig.ruby_lsp.setup { ruby_lsp_config }
end
