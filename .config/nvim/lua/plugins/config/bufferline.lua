require("bufferline").setup{
   options = {
     numbers = function(opts)
       return string.format("%s.", opts.id)
     end,
     diagnostics = false,
     show_buffer_icons = true,
     show_buffer_close_icons = false,
     show_close_icon = false,
     always_show_bufferline = true,
     show_tab_indicators = false,
     offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = 'left' }}
   }
}
