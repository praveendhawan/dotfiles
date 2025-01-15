local chat = require "CopilotChat"

chat.setup {
  -- Default model
  model = "claude-3.5-sonnet",
  -- Default context for differnt context types
  contexts = {
    file = {
      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/issues/690
      input = function(callback)
        local telescope = require "telescope.builtin"
        local actions = require "telescope.actions"
        -- local utils = require "telescope.actions.utils"
        local action_state = require "telescope.actions.state"
        telescope.find_files {
          previewer = true,
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              callback(selection[1])
            end)
            return true
          end,
        }
      end,
    },
    buffer = {
      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim/issues/690
      input = function(callback)
        local telescope = require "telescope.builtin"
        local actions = require "telescope.actions"
        -- local utils = require "telescope.actions.utils"
        local action_state = require "telescope.actions.state"
        telescope.buffers {
          previewer = true,
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              callback(selection[1])
            end)
            return true
          end,
        }
      end,
    },
  },
}
