TelescopeBaseConfig = {
    defaults = {
        prompt_prefix = "$ ",
        layout_strategy = "center",
        layout_config = {width = 0.7,
                         height = 0.5},
        mirror = true,
    },
            --mappings
    --extensions = {}
}

vim.api.nvim_set_keymap('n', '<space>ff', '<cmd>Telescope find_files hidden=true <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>FF', '<cmd>Telescope git_files hidden=true <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>fg', '<cmd>Telescope live_grep <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>fs', '<cmd>Telescope treesitter <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>fc', '<cmd>Telescope commands<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>fm', '<cmd>Telescope keymaps <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>fr', '<cmd>Telescope registers <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<space>b', '<cmd>Telescope buffers <CR>', {noremap = true})
require('telescope').setup(TelescopeBaseConfig)
--vim.api.nvim_set_keymap('n', :
