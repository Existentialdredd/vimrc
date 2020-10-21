"if exists('##TextYankPost')
    "autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank('QuickFixLine', 200)
"endif


augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
