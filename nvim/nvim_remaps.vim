" Restart with plugin install
map <silent> <Leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'init.vim reloaded'"<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" run current python script in tmux pane below
map <silent> <Leader>t :w <CR> :!tsb python3 %:p <CR>
map <silent> <Leader>T :w <CR> :!tsb   %:p<Left><Left><Left><Left>
" run current python script in dispatch below
map <silent> <Leader>d :w <CR> :Dispatch python3 %:p <CR>
map <silent> <Leader>D :w <CR> :Dispatch   %:p<Left><Left><Left><Left>

" write buffer
nnoremap <silent> <Leader>w :w <CR>

" move windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
" resizing
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>

" marks and visual mode ?
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" replace all instances in current search result highlighing
nnoremap <leader>r :%s///g<Left><Left>
nnoremap <leader>rc :%s///gc<Left><Left><Left>

" find and replace the highlighted text (in visual mode) globally
vnoremap <C-h> ""y:%s/<C-R>=escape(@", '/\')<CR>//gc<Left><Left>

nnoremap <leader>B :buffers <CR>:b<space>
map <leader>b :Buffers<CR>
