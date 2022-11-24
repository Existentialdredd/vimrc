local util = require 'lspconfig.util'

-- nvim-cmp
vim.o.completeopt = 'menu,menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'
CmpBaseConfig = {
snippet = {
  expand = function(args)
             vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
             end,
},
mapping = {
  ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
  ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  ['<C-f>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(),}),
  ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
},
experimental = {
  native_menu = false,
  ghost_text = true
    },
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'ultisnips' },
}, {
  { name = 'buffer' },
})
}
cmp.setup(CmpBaseConfig)

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  }
)

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- lspconfig setup

-- Function that executes whenever a lsp "attaches" to a buffer
local custom_lsp_attach = function(client)
    print("I am attached bro")
  -- See `:help nvim_buf_set_keymap()` for more information
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<K>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-n>', '<cmd>lua vim.diagnostic.goto_next()<CR> <cmd>lua vim.diagnostic.open_float()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-p>', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Use LSP as the handler for formatexpr.
  --    See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
  end

local pyright = require('lspconfig').pyright
PyrightBaseConfig = {
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                extraPaths = {'/Users/ericpenner/',},
                },
            },
        },
}
pyright.setup(PyrightBaseConfig)

--Base Language Server
local bashls = require('lspconfig').bashls
BashBaseConfig = { capabilities=capabilities, on_attach = custom_lsp_attach }
bashls.setup(BashBaseConfig)

--Docker Language Server
--local dockerls = require('lspconfig').dockerls
--DockerBaseConfig = { capabilities=capabilities, on_attach = custom_lsp_attach }
--dockerls.setup(DockerBaseConfig)

--Vim Language Server
--local vimls = require('lspconfig').vimls
--VimBaseConfig = {capabilities=capabilities}
--vimls.setup(VimBaseConfig)

-- Lua-Language-Server
--local luals = require('lspconfig').sumneko_lua
--local runtime_path = vim.split(package.path, ';')
--table.insert(runtime_path, "lua/?.lua")
--table.insert(runtime_path, "lua/?/init.lua")

--LuaBaseConfig = {
  --on_attach = custom_lsp_attach,
  --capabilities = capabilities,
  --cmd = { "lua-language-server"},
  --filetypes = { "lua" },
  --root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git"),
  --single_file_support = true,
  --settings = {
    --Lua = {
      --runtime = {
        ---- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        --version = 'LuaJIT',
        ---- Setup your lua path
        --path = runtime_path,
      --},
      --diagnostics = {
        ---- Get the language server to recognize the `vim` global
        --globals = {'vim'},
      --},
      --workspace = {
        ---- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
      --},
      ---- Do not send telemetry data containing a randomized but unique identifier
      --telemetry = {
        --enable = false,
      --},
    --},
  --},
--}
--luals.setup(LuaBaseConfig)
