local o = vim.o
-- Folding
-- Use treesitter for folding
-- o.foldmethod = "expr"
-- o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- --
o.foldcolumn = "1"
-- -- By setting this to an empty string, it means that the first line of the fold will be syntax highlighted, rather than all be one colour.
-- -- o.foldtext = "" -- Only in nightly
-- -- Setting foldlevel sets the minimum level of a fold that will be
-- -- closed by default.
o.foldlevel = 99
-- -- use foldlevelstart to dicate upon editing a buffer what level of
-- -- folds should be open by default vs close
o.foldlevelstart = 99
-- -- This limits how deeply code gets folded
-- o.foldnestmax = 10

-- Adding number suffix of folded lines instead of the default ellipsis
-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#customize-fold-text
local foldsHandler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
require("ufo").setup {
  fold_virt_text_handler = foldsHandler,
  provider_selector = function(_, _, _)
    return { "treesitter", "indent" }
  end,
}
