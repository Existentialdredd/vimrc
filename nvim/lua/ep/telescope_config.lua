TelescopeBaseConfig = {
    defaults = {
        prompt_prefix = "$ ",
        selection_caret = "> ",
        entry_prefix = " ",
        multi_icon = "+",
        intial_model = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        color_devicon = true,
        layout_strategy = "vertical",
        layout_config = {
            width = 0.8,
            height = 0.7,
            prompt_position = "bottom",
        },
    },
    extensions = {
        file_browser = {
            grouped = true,
            hidden = true,
        },
    },
}
require("telescope").setup(TelescopeBaseConfig)
require("telescope").load_extension("file_browser")
require("telescope").load_extension("dap")
--require("telescope").load_extension("fzf")

vim.api.nvim_set_keymap('n', '<space>ff', '<cmd> Telescope find_files hidden=true <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fF', '<cmd> Telescope git_files <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fg', '<cmd> Telescope live_grep <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fb', '<cmd> Telescope file_browser <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fc', '<cmd> Telescope commands <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fs', '<cmd> Telescope treesitter <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>b',  '<cmd> Telescope buffers <CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<space>fr', '<cmd> Telescope registers <CR>', {noremap=true})



