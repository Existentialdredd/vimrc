local augroup = vim.api.nvim_create_augroup
local trim_group = augroup('TrimWhiteSpace', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

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
