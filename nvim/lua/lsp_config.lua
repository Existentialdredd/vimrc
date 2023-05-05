local util = require 'lspconfig.util'

-- nvim-cmp

vim.o.completeopt = 'menu,menuone,noselect'

-- nvim-cmp setup
local cmp = require 'cmp'

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
    snippet = {
      expand = function(args)
                 vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                 end,
    },
    mapping = {
      ["<Tab>"] = cmp.mapping({
          c = function()
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              else
                  cmp.complete()
              end
          end,
          i = function(fallback)
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                  vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
              else
                  fallback()
              end
          end,
          s = function(fallback)
              if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                  vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
              else
                  fallback()
              end
          end
      }),
      ["<S-Tab>"] = cmp.mapping({
          c = function()
              if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
              else
                  cmp.complete()
              end
          end,
          i = function(fallback)
              if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
              elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                  return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
              else
                  fallback()
              end
          end,
          s = function(fallback)
              if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                  return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
              else
                  fallback()
              end
          end
      }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<C-n>'] = cmp.mapping({
          c = function()
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                  vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
              end
          end,
          i = function(fallback)
              if cmp.visible() then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                  fallback()
              end
          end
      }),
      ['<C-p>'] = cmp.mapping({
          c = function()
              if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              else
                  vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
              end
          end,
          i = function(fallback)
              if cmp.visible() then
                  cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              else
                  fallback()
              end
          end
      }),
      ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
      ['<S-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
      ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
      ['<C-Space>'] = cmp.mapping({
          i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
          c = function(fallback)
              if cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                  fallback()
              end
          end
      }),
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
  })

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
  })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>Fm', '<cmd>lua vim.lsp.buf.format()<CR>', {noremap = true})
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

Pyright_base_config = {
    on_attach = custom_lsp_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                extraPaths = {'/Users/ericpe/.pyenv/versions/ganwork0/lib/python3.9/site-packages',},
                },
            },
        },
}
 pyright.setup(Pyright_base_config)


require('lspconfig').bashls.setup({ capabilities=capabilities, on_attach = custom_lsp_attach })
require('lspconfig').dockerls.setup({ capabilities=capabilities, on_attach = custom_lsp_attach })
require('lspconfig').vimls.setup({ capabilities=capabilities, on_attach = custom_lsp_attach })
require('lspconfig').r_language_server.setup({ capabilities=capabilities, on_attach = custom_lsp_attach })
require('lspconfig').r_language_server.document_config.default_config.filetypes = {'r', 'rmd', 'R'}
require('lspconfig').jsonls.setup({ capabilities=capabilities, on_attach = custom_lsp_attach})
require('lspconfig').yamlls.setup({ capabilities=capabilities, on_attach = custom_lsp_attach})
require('lspconfig').html.setup({ capabilities=capabilities, on_attach = custom_lsp_attach})


-- Lua-Language-Server
local luals = require('lspconfig').sumneko_lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

luals.setup({
  on_attach = custom_lsp_attach,
  capabilities = capabilities,
  cmd = { "lua-language-server"},
  filetypes = { "lua" },
  root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "selene.toml", ".git"),
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

vim.api.nvim_create_user_command('Format', 'lua vim.lsp.buf.format()', {})
