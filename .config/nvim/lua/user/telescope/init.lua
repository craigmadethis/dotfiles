-- # Telescope
require('telescope').setup {
  defaults =  {
    mappings = {
      i={
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      }
    },
    pickers ={
      buffers ={
        ignore_current_buffer = true,
        sort_mru = true
      }
    }

  }
}
-- ## telescope + fzf
pcall(require('telescope').load_extension, 'fzf')

-- keymaps
require('user.telescope.keymaps')
