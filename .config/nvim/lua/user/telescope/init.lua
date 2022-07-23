-- # Telescope
require('telescope').setup {
  defaults =  {
    mappings = {
      i={
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      }
    }
  }
}
-- ## telescope + fzf
pcall(require('telescope').load_extension, 'fzf')

-- keymaps
require('user.telescope.keymaps')
