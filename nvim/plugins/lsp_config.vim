lua require('lspconfig').pyright.setup{}
lua require('lspconfig').bashls.setup{}
lua require('lspconfig').dockerls.setup{}
lua require('lspconfig').vimls.setup{}
"lua require('lspconfig').r_language_server.setup{cmd = { "R", "--slave", "-e", "languageserver::run()" }, filetypes = { "r", "rmd" }, log_level = 2, root_dir = 'root_pattern(".git") or os_homedir' }
lua require('lspconfig').r_language_server.setup({})
lua require('lspconfig').r_language_server.document_config.default_config.filetypes = {'r', 'rmd', 'R'}

nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-h> <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-s> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-r> <cmd>lua vim.lsp.buf.rename()<CR>
