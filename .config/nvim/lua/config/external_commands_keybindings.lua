-- KeyBindings for External Softwares/Commands

local no_opt = {}

-- Seeing is Believing
-- Assumes you have a Ruby with SiB available in the PATH
-- If it doesn't work, you may need to `gem install seeing_is_believing`

-- Annotate Every Line
vim.api.nvim_set_keymap('n', '<leader>b', ':%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>', no_opt)

-- Annotate ,arked lines
vim.api.nvim_set_keymap('n', '<leader>n', ':%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>', no_opt)
--
-- Remove Annotations
vim.api.nvim_set_keymap('n', '<leader>c', ':%.!seeing_is_believing --clean<cr>', no_opt)

-- Mark current line for annotation
vim.api.nvim_set_keymap('n', '<leader>m', 'A # => <EsC>', no_opt)

-- Mark the highlighted lines for annotation
vim.api.nvim_set_keymap('v', '<leader>m', ':norm A # => <Esc>', no_opt)
