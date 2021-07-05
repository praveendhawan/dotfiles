require'nvim-treesitter.configs'.setup {
  refactor = {
    -- Highlights definition and usages of the current symbol under the cursor.
    highlight_definitions = { enable = true },
    -- Highlights the block from the current scope where the cursor is.
    highlight_current_scope = { enable = true },
    -- Renames the symbol under the cursor within the current scope (and current file).
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    -- "go to definition" for the symbol under the cursor,
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        -- Somehow the below keymaps dont work
        -- goto_next_usage = "<a-*>", -- ALT/META + *
        -- goto_previous_usage = "<a-#>" -- ALT/META + #
      }
    }
  }
}
