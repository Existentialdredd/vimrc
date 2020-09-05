set nocompatible " be iMproved, required
set noerrorbells
set nowrap
set background=dark
set directory^=$HOME/.vim/tmp// " place for all swap files
set cursorline " highlight the textline of the cursor
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set laststatus=2
set noshowmode " message of the mode you are in
set history=1000 "keep 1000 items in the history
set ruler "show the cursor position
set clipboard=unnamed 	"better copy and paste
set mouse=a " enable the use of a mouse
set showcmd " show incomplete command
set shiftwidth=4
set tabstop=4
set wildmenu " show completion matches
set hlsearch " highlights search results
set incsearch " showing partial matches 
set ignorecase " ignore case in search 
set smartcase " 
syntax on 
"set line numbers
set number
set relativenumber
set ai "setting auto indent
set si
set bg=dark "indicating a dark background
set hidden "setting hidden
set shellcmdflag=-ic "setting command mode to interactive

" --------------Plugins------------------
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
"Plugin 'itchyny/lightline'
Plug 'davidhalter/jedi-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
"Plugin 'fholgado/minibufexpl.vim'
Plug 'suan/vim-instant-markdown'
"Plugin 'nvie/vim-flake8'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

call plug#end()
""""""""""" KEY REMAPS """""""""""""""""""
let mapleader=" "
map <silent> <Leader>v :source ~/.vimrc <CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <silent> <Leader>nt :NERDTree <CR>

" run current python script in window below
nnoremap <leader>t :w <CR> :!tsb python3 %:p <CR>
nnoremap <leader>T :w <CR> :!tsb  %:p<Left><Left><Left><Left>
nnoremap <leader>y :w <CR> :!tsr python3 %:p <CR>
nnoremap <leader>Y :w <CR> :!tsr python3 -i %:p <CR>
nnoremap <leader>w :w <CR>	

" dfind and replace,
" replace all instances in current search result highlighing
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

"nnoremap <leader>l :bn <CR>
"nnoremap <leader>h :bp <CR>
nnoremap <leader>B :buffers <CR>:b<space>

nnoremap <leader>L :tabn <CR>
nnoremap <leader>H :tabp <CR>

nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>l :wincmd l<CR>

"page scrolling
nnoremap <leader>u <c-u>
nnoremap <leader>d <c-d>

" Undotree remaps
nnoremap <leader>U :UndotreeToggle<CR>

" fzf remaps
map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>s :Rg<CR>
"nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

" ------------------ cursor appearance ----------
let &t_SI.="\e[5 q" "SI = INSERT MODE
let &t_SR.="\e[4 q" "SR = REPLACE MODE
let &t_EI.="\e[1 q" "EI = NORMAL MODE

" ------------------coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"fun! GoCoc()
inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-@> coc#refresh()

" oTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
nnoremap <buffer> <leader>cr :CocRestart
" Use K to show documentation in preview window.
"nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>
"endfunction

" ------------------jedi-vim---------------------
" jedi-vim options
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures=2
"let g:jedi#popup_select_first = 1

" jedi-vim command options
let g:jedi#goto_command = "<leader>gd"
"let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_stubs_command = "<leader>gs"
"let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gu"
"let g:jedi#completions_command = "<c-space>"
"let g:jedi#rename_command ="<leader>gr"

" jedi vim autocomplete popup menu highlighting
"highlight Pmenu ctermbg=Red
"highlight PmenuSel ctermbg=White

" ------------------fzf -----------------------
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
  
"let g:fzf_tags_command = 'ctags -R'
"" Border color
"let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

"let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
"let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" -------------------------
let NERDTreeShowHidden=1
" -------------------colors------------------
"colorscheme solarized
"let g:solarized_contrast="high"
"let g:solarized_termcolors=256
"colorscheme palenight
 colorscheme onedark

" -------------------lightline&airline-------
let g:lightline = { 'colorscheme': 'solarized', } 
"let g:lightline = { 'colorscheme': 'palenight' }


let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

" ----------------- instant markdown ----------
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

"autocmd FileType python map <buffer> <leader>f :call flake8#Flake8()<CR>"

"autocmd FileType py :call GoCoc()
