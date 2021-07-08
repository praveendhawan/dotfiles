local Path = require('plenary.path')
local Job = require('plenary.job')

function Gbrowse()
  local path = Path:new(vim.api.nvim_buf_get_name(0))
  local relative_path = path:make_relative()
  local current_branch = vim.b.gitsigns_head
  local row = vim.api.nvim_win_get_cursor(0)[1]

  Job:new({
    command = 'gh',
    args = {
      'browse',
      relative_path ..':' .. row,
      '-b',
      current_branch
    },
    enable_handlers = true,
    enable_recording = true,
    on_exit = function(_, return_val)
      print(return_val)
    end,
    on_stderr = function(error, _, _)
      print(error)
    end,
  }):start()
end
