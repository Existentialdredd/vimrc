set guicursor=n-v-c:block
              \,i-ci-ve:ver80
              \,r-cr:hor90
              \,o:hor50
		      \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		      \,sm:block-blinkwait175-blinkoff150-blinkon175
set relativenumber
"set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set signcolumn=yes
"set termguicolors
set scrolloff=8
set noshowmode
set pyxversion=3
set cmdheight=2     " Give more space for displaying messages.
set updatetime=50   " shorter  update time than default
set shortmess+=c    " Don't pass messages to |ins-completion-menu|.
set cursorline
set background=dark

highlight CursorLine ctermbg=0 guibg=lightgrey  " cursorline highlightinh
highlight Visual ctermbg=0 guibg=white

let loaded_matchparen = 1
let mapleader = " "

" terminal mode
:tnoremap <Esc> <C-\><C-n>


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

autocmd BufWritePre * :call TrimWhitespace()

vnoremap X "_d
inoremap <C-c> <esc>

set shellcmdflag=-ic

let g:python3_host_prog = "~/.pyenv/versions/3.7.3/bin/python3.7"
