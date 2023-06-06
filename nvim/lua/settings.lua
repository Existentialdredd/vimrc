
vim.opt.guicursor = {"n-v-c:block",
                     "r-cr:hor90",
                     "i-ci-ve:ver80",
                     "o:hor50",
                     "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
                     "sm:block-blinkwait175-blinkoff150-blinkon175"
                 }
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab=true
vim.o.smartindent=true
vim.o.nu=true
vim.o.wrap=false
vim.o.smartcase=true
vim.o.swapfile=false
vim.o.backup=false
--vim.o.undodir="~/.vim/undodir"
vim.o.undofile=false
vim.o.incsearch=true
vim.o.signcolumn="yes"
--vim.o.termguicolors
vim.o.scrolloff=8
vim.o.showmode=true
vim.o.pyxversion=3
vim.o.cmdheight=2
vim.o.updatetime=50
vim.o.shortmess="c"
vim.o.cursorline=true
vim.o.shellcmdflag="-ic"
vim.g.python3_host_prog = os.getenv("PYTHON_PROG3")
vim.g.loaded_matchparen = 1
vim.g.mapleader = " "

vim.o.background="dark"
vim.cmd([[colorscheme kanagawa-wave]])
