
set guicursor=n-v-c:block
              \,i-ci-ve:ver100
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
"set termguicolors
set scrolloff=8
set noshowmode


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey
set cursorline
highlight CursorLine ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
"Plug 'theprimeagen/vim-am'
Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'

call plug#end()

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" -- vim python (polglot) settings
let g:python_highlight_all = 1
"let g:python_highlight_builtins = 1
"let g:python_highlight_exceptions = 1
"let g:python_highlight_string_formatting = 1
"let g:python_highlight_string_format = 1
"let g:python_highlight_string_templates = 1
"let g:python_highlight_indent_errors = 1
"let g:python_highlight_space_errors = 1
"let g:python_highlight_doctests = 1
"let g:python_print_as_function = 1
"let g:python_highlight_func_calls = 1
"let g:python_highlight_class_vars= 1
"let g:python_highlight_operators = 1

let g:python_highlight_builtin_objs = 1
let g:python_highlight_builtin_types = 1
let g:python_highlight_builtin_funcs = 1

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

map <silent> <Leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
map <silent> <Leader>nt :NERDTree <CR>

" run current python script in window below
map <silent> <Leader>t :w <CR> :!tsb python3 %:p <CR>
map <silent> <Leader>T :w <CR> :!tsb   %:p<Left><Left><Left><Left>

map <silent> <Leader>d :w <CR> :Dispatch python3 %:p <CR>
map <silent> <Leader>D :w <CR> :Dispatch   %:p<Left><Left><Left><Left>

nnoremap <silent> <Leader>w :w <CR>

nnoremap <leader>fH :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fc :CocSearch
nnoremap <leader>fC :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>fg :Rg<SPACE> <CR>
nnoremap <leader>fG :Rg <C-R>=expand("<cword>")<CR><CR>
"nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fF :GFiles<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <leader>u :UndotreeShow<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" replace all instances in current search result highlighing
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>
vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//g<Left><Left>

nnoremap <leader>B :buffers <CR>:b<space>
map <leader>b :Buffers<CR>


" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

vnoremap X "_d
inoremap <C-c> <esc>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
"nmap <leader>gd <Plug>(ale-go-to-definition)
nmap <leader>gt <Plug>(coc-type-definition)
"nmap <leader>gt <Plug>(ale_go_to_type_definition)
nmap <leader>gi <Plug>(coc-implementation)
"nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
"nmap <leader>gr <Plug>(ale_find_references)
nmap <leader>rr <Plug>(coc-rename)
"nmap <leader>rr <Plug>(ale_rename)
"nmap K <Plug>(ale_documentation)
"nmap <leader>g[ <Plug>(coc-diagnostic-prev)
"nmap <leader>g] <Plug>(coc-diagnostic-next)
"nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
"nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" terminal mode
:tnoremap <Esc> <C-\><C-n>
"
" ------------------jedi-vim---------------------
" jedi-vim options
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
"let g:jedi#use_tabs_not_buffers = 0
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures=2
"let g:jedi#popup_select_first = 1

" jedi-vim command options
"let g:jedi#goto_command = "<leader>gd"
"let g:jedi#goto_assignments_command = "<leader>ga"
"let g:jedi#goto_stubs_command = "<leader>gs"
"let g:jedi#goto_definitions_command = "<leader>gd"
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>gu"
"let g:jedi#completions_command = "<c-space>"
"let g:jedi#rename_command ="<leader>gr"

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

" Use K to show documentation in preview window.
nnoremap <buffer> <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" ------------------------
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

set shellcmdflag=-ic
