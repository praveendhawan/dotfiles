require("bufferline").setup{
   options = {
     numbers = "buffer_id",
     number_style = "none",
     diagnostics = false,
     mappings = false,
     show_buffer_icons = true,
     show_buffer_close_icons = false,
     show_close_icon = false,
     always_show_bufferline = true,
     show_tab_indicators = false,
     offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = 'left' }}
   }
}
