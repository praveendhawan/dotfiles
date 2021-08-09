require('telescope').setup {
  extensions = {
    fzf_writer = {
      minimum_files_characters = 2,
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf_writer')
