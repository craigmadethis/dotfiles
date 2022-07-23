-- # SETTING OPTIONS 
-- `:help vim.o / vim.wo`

-- ## search options
vim.o.hlsearch=false -- check tj files to only show on this buffer
vim.o.ignorecase=true
vim.o.smartcase=true

-- ## line numbers
vim.wo.number = true
vim.o.relativenumber=true

-- ## completion
vim.o.completeopt="menuone,noselect"

--## update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--# splits
vim.opt.splitbelow=true
vim.opt.splitright=true
-- ## misc
vim.o.mouse ='a' --enabling mouse mode
vim.o.breakindent=true
vim.o.undofile=true
vim.o.backup=false
vim.opt.clipboard="unnamedplus"
vim.opt.cmdheight=1
vim.opt.conceallevel=0
vim.opt.fileencoding="utf-8"
vim.opt.showmode=false --removes --INSERT--/--NORMAL-- etc
vim.opt.expandtab=true -- tabs=spaces
vim.opt.shiftwidth=2 -- tabs=spaces
vim.opt.tabstop=2 -- tabs=spaces
vim.opt.cursorline=true
vim.opt.wrap=true
vim.opt.textwidth=79
vim.opt.scrolloff=8 -- number of lines above/below current cursor in scroll i.e. when jump to a line show 8 lines above it

-- when do cw on word-liek-this it selects it all 
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.timeoutlen=1000
vim.opt.ttimeoutlen=1000

-- ## colourscheme
vim.o.termguicolors=true
-- vim.cmd [[colorscheme onedark]]
vim.g.tokyonight_style="night"
vim.cmd [[colorscheme tokyonight]]
