-- Improves cursor movement performance
vim.g.matchup_matchparen_deferred = 1
-- Disable matchup text objects
vim.g.matchup_text_obj_enabled = 0
-- Disable matchup within strings and comments
-- recognize symbols within comments
vim.g.matchup_delim_noskips = 1
-- Number of lines to search in either direction while highlighting matches
-- Default is 400
vim.g.matchup_matchparen_stopline = 100
