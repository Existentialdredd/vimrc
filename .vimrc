set nocompatible              " be iMproved, required
set hidden
set relativenumber
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

set colorcolumn=95
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
filetype off                  " required

let mapleader =","
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NERDTree
Plugin 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
" NERDCommenter
Plugin 'preservim/nerdcommenter'
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" vim solarized" 
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
Plugin 'joshdick/onedark.vim'
" Polyglot syntax highlighting
Plugin 'sheerun/vim-polyglot'
" Jedi Autocomplete
"Plugin 'davidhalter/jedi-vim'
Plugin 'neoclide/coc.nvim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required

syntax on
" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PluginInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <silent> <Leader>nt :NERDTree <CR>

" run current python script in window below
map <silent> <Leader>t :w <CR> :!tsb python3 %:p <CR>
nnoremap <silent> <Leader>w :w <CR>

nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-l> <c-w>l 

"page scrolling
nnoremap <leader>k <c-u>
nnoremap <leader>j <c-d>

" next tab
nnoremap <leader>l :tabn <CR>
nnoremap <leader>L :bn <CR>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
set cursorline

"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"
"jedi-vim options
let g:jedi#show_call_signatures=2

"vim-colors-solarized
set background=dark

" place for all swap files
set directory^=$HOME/.vim/tmp//

"vim-colors-solorized
let g:solarized_contrast="high"
let g:solarized_termcolors=256
colorscheme onedark
"colorscheme palenight
"setting color scheme

"vim-lightline
"let g:lightline = { 'colorscheme': 'solarized', }               "vim-lightline
"let g:lightline = { 'colorscheme': 'palenight' }

set laststatus=2                                                "vim-lightline
set noshowmode 

"keep 1000 items in the history
set history=1000

"vim-lightline
"let g:lightline = { 'colorscheme': 'solarized', }               "vim-lightline
"let g:lightline = { 'colorscheme': 'palenight' }

set laststatus=2                                                "vim-lightline
set noshowmode 

"keep 1000 items in the history
set history=1000

"show the cursor position
set ruler

"mode settings
let &t_SI.="\e[5 q" "SI = INSERT MODE
let &t_SR.="\e[4 q" "SR = REPLACE MODE
let &t_EI.="\e[1 q" "EI = NORMAL MODE

"better copy and paste
set clipboard=unnamed

"mouse
set mouse=a "on OSX press alt and click

"show incomplete command
set showcmd

"setting tabs to 4 spaces
set shiftwidth=4
set tabstop=4

"show completion matches
set wildmenu

"set scrolling offset
set hlsearch
set incsearch
set ignorecase
set smartcase

"syntax
syntax on 

"set line numbers
set number

"setting auto indent
set ai
set si

"indicating a dark background
set bg=dark

"setting hidden
set hidden

"setting command mode to interactive
set shellcmdflag=-ic

" jedi vim autocomplete popup menu highlighting
highlight Pmenu ctermbg=Red
highlight PmenuSel ctermbg=White
let g:airline#extensions#tabline#enabled = 1
" vim: set ft=vim ::w
