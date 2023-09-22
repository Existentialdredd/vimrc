local augroup = vim.api.nvim_create_augroup
local trim_group = augroup('TrimWhiteSpace', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})
local open_folds = augroup('OpenFolds', {})


function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = trim_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

function SetFolds()
    vim.opt_local.foldmethod="expr"
    vim.opt_local.foldexpr="nvim_treesitter#foldexpr()"
    vim.cmd('normal zR')
    vim.cmd('echo "Folding Activated"')
end

--autocmd({"BufReadPost", "FileReadPost"}, {
    --group = open_folds,
    --pattern = "*.json",
    --callback = SetFolds,
--})


