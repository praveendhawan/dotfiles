--[[
vim.cmd[[
  " Function to override seti highlights
  function! SetiHighlights() abort
    hi Search            ctermfg=Black ctermbg=74   cterm=NONE      guifg=Black   guibg=#4fa5c7 gui=NONE
    hi Visual            ctermfg=Black ctermbg=93   cterm=NONE      guifg=Black   guibg=#664dc9 gui=NONE
    hi Folded            ctermfg=130   ctermbg=NONE cterm=NONE      guifg=#af5f00 guibg=NONE    gui=NONE
    hi CocHighlightText  ctermfg=93    ctermbg=NONE cterm=NONE      guifg=#664dc9 guibg=NONE    gui=NONE
    hi TreesitterContext ctermfg=Black ctermbg=190  cterm=BOLD      guifg=Black   guibg=#d7ff00 gui=NONE
    hi MatchParen        ctermfg=Black ctermbg=190  cterm=BOLD      guifg=Black   guibg=#d7ff00 gui=NONE
    hi MatchWord         ctermfg=Black ctermbg=190  cterm=NONE      guifg=Black   guibg=#d7ff00 gui=BOLD
  hi QuickScopePrimary   ctermfg=155                cterm=underline guifg=#afff5f               gui=underline
  hi QuickScopeSecondary ctermfg=81                 cterm=underline guifg=#5fffff               gui=underline
  endfunction

  " AutoCommand Group
  augroup colorscheme_seti_highlights
    " Remove Previous AutoCommands
    autocmd!
    " Define New AutoCommand for Colorscheme Event
    autocmd Colorscheme seti call SetiHighlights()
 augroup END

 " Set colorscheme to seti
 colorscheme seti
]]
--]]
-- vim.cmd([[colorscheme gruvbox]])
vim.g.tokyonight_colors = {
  border = "orange"
}

vim.g.tokyonight_style = "night"

vim.cmd([[colorscheme tokyonight]])
