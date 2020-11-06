
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <leader>fH :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>fg :Rg<SPACE> <CR>
nnoremap <leader>fG :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fF :GFiles<CR>
nnoremap <Leader>fh :History:<CR>
nnoremap <Leader>fH :History:<C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fL :Lines<C-R>=expand("<cword>")<CR><CR>

if executable('rg')
    let g:rg_derive_root='true'
endif
