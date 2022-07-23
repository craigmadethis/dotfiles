-- # KEYMAPS

-- ## setting leader - must happen before requiring plugins
vim.g.mapleader=" "
vim.g.localmapleader=" "

-- something about this being a better default experience for keymappings 
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent=true})

--## word wrap
vim.keymap.set('n', 'k', "v:count==0 ? 'gk' : 'k'", {expr=true, silent=true})
vim.keymap.set('n', 'j', "v:count==0 ? 'gj' : 'j'", {expr=true, silent=true})

-- ## window nav 
vim.keymap.set('n', "<C-h>" , "<C-w>h")
vim.keymap.set('n', "<C-k>" , "<C-w>k")
vim.keymap.set('n', "<C-l>" , "<C-w>l")

-- window resizing
vim.keymap.set('n', "<C-Up>" , ":resize -2<CR>")
vim.keymap.set('n', "<C-Down>" , ":resize +2<CR>")
vim.keymap.set('n', "<C-Left>" , ":vertical resize -2<CR>")
vim.keymap.set('n', "<C-Right>" , ":vertical resize +2<CR>")

-- buffer cycling
vim.keymap.set('n', "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set('n', "<S-h>", ":BufferLineCyclePrev<CR>")

-- QuickFix
vim.keymap.set('n', "]q", ":cnext<CR>")
vim.keymap.set('n', "[q", ":cprev<CR>")
vim.keymap.set('n', "<C-q>", ":call QuickFixToggle()<CR>")

