set nocompatible              " be iMproved, required
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

" vim solarized" 
Plugin 'altercation/vim-colors-solarized'
"Plugin 'dracula/vim'

" Polyglot syntax highlighting
Plugin 'sheerun/vim-polyglot'
"Plugin 'vim-python/python-syntax'
" Lightline plugin
Plugin 'itchyny/lightline.vim'

" Jedi Autocomplete
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on    " required

syntax on
" reloads .vimrc -- making all changes active
map <silent> <Leader>v :source ~/.vimrc<CR>:PluginInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <silent> <Leader>nt :NERDTree <CR>
let g:solarized_contrast="high"
"
"jedi-vim options
let g:jedi#show_call_signatures=2

"vim-colors-solarized
set background=dark

let g:solarized_termcolors=256
colorscheme solarized
"vim-colors-solorized

" vim-lightline
let g:lightline = { 'colorscheme': 'solarized', }               "vim-lightline
set laststatus=2                                                "vim-lightline
set noshowmode 
"vim-lightline

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

"setting color scheme
color slate

"setting hidden
set hidden

" jedi vim autocomplete popup menu highlighting
highlight Pmenu ctermbg=Red
highlight PmenuSel ctermbg=White

" vim: set ft=vim :
