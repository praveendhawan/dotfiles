local M = {
  display = {
    chat = {
      auto_scroll = false,
      start_in_insert_mode = true
    },
    diff = {
      provider = "mini_diff", -- default|mini_diff
    },
  },
  adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-3.5-sonnet",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = {
        name = "copilot",
        model = "claude-3.7-sonnet",
      },
      tools = {
        opts = {
          auto_submit_errors = true, -- Send any errors to the LLM automatically?
          auto_submit_success = true, -- Send any successful output to the LLM automatically?
        },
      },
      opts = {
        completion_provider = "blink", -- blink|cmp|coc|default
      }
    },
    inline = {
      adapter = {
        name = "copilot",
        model = "claude-3.5-sonnet"
      },
    },
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    },
  }
}

return M
