require('dash').setup({
  dash_app_path = '/Applications/Dash.app',
  file_type_keywords = {
    NvimTree = false,
    TelescopePrompt = false,
    terminal = false,
    packer = false,
    ruby = { 'ruby', 'rails', 'rubygems', 'rubystrftime', 'railscli', 'rspec', 'yard' },
    javascript = { 'javascript', 'jquery', 'vue' },
    typescript = { 'javascript', 'jquery', 'vue' },
    vue = { 'javascript', 'vue' },
    rust = { 'rust' },
    elixir = { 'elixir', 'hex' },
  },
})
