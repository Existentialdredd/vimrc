require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {'python', 'luals', 'dockerls', 'bashls', 'pyright', 'html', 'jsonls'},
})
