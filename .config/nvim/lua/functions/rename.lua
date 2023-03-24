local custom_functions = require 'functions.utils'

function custom_functions.rename(new_name, bang)
  print(new_name)
  local bang_word = ''

  if bang then
    bang_word = '! '
  end
  -- Absolute path to current file
  local current_file = vim.fn.expand("%:p")
  -- Path of the directory in which the current_file is present
  -- with a `/` in the last (it will be concatenated)
  local current_path = vim.fn.expand("%:h") .. "/"

  -- Save file with new name
  -- fnameescape - handle file names with spaces correctly
  vim.cmd("silent! saveas " .. bang_word .. " " .. vim.fn.fnameescape(current_path .. new_name))

  -- Deleting the old file
  local old_file = current_file
  current_file = vim.fn.expand("%:p")

  if current_file ~= old_file and vim.fn.filewritable(current_file) then
    vim.cmd("silent! bd! " .. vim.fn.fnameescape(old_file))
    if vim.fn.delete(old_file) > 0 then
      vim.api.nvim_err_writeln("Could not delete " .. old_file)
    else
      vim.cmd("silent! edit " .. vim.fn.fnameescape(current_file))
    end
  end
end

return custom_functions
