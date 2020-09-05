
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

nnoremap <leader>fH :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>fg :Rg<SPACE> <CR>
nnoremap <leader>fG :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fF :GFiles<CR>

if executable('rg')
    let g:rg_derive_root='true'
endif
