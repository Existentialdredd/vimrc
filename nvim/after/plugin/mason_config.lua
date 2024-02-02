require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {'python', 'lua_ls', 'dockerls', 'bashls', 'pyright', 'html', 'jsonls'},
})
