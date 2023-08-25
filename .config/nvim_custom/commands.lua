local new_cmd = vim.api.nvim_create_user_command
local abbrev = vim.api.nvim_command

new_cmd("BufCloseAll", 'execute "%bufdo bd"', {})
abbrev('abbr bda BufCloseAll')

new_cmd("BufCloseAllButCurrent", 'execute "%bd|e#|bd#"', {})
abbrev('abbr bca BufCloseAllButCurrent')
