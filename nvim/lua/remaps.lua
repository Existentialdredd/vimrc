--map <silent> <Leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'init.vim reloaded'"<CR>
vim.api.nvim_set_keymap("n", "<Leader><CR>", ":so ~/.config/nvim/init.vim<CR>", {silent=true, noremap=true})

-- write buffer
vim.api.nvim_set_keymap("n", "<Leader>w" ,":w <CR>", {silent=true, noremap=true})

-- move windows
vim.api.nvim_set_keymap("n", "<leader>h", ":wincmd h<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>j", ":wincmd j<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>k", ":wincmd k<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>l", ":wincmd l<CR>", {silent=true, noremap=true})

-- resizing
vim.api.nvim_set_keymap("n", "<Leader>rp",":resize 100<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>+", ":vertical resize +5<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Leader>-", ":vertical resize -5<CR>",  {silent=true, noremap=true})
--vim.api.nvim_set_keymap("n", <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>,  {silent=true, noremap=true})

-- replace all instances of last search result highlighing
--vim.api.nvim_set_keymap("n", "<leader>rs", ":%s/<C-R>///g<Left><Left>",  {silent=true, noremap=true})
-- vim.api.nvim_set_keymap("n", <leader>rc :%s///gc<Left><Left><Left>

-- find and replace the highlighted text (in visual mode) globally
vim.api.nvim_set_keymap("v", "<Leader>rh", "''y:%s/<C-R>=escape(@', '/\')<CR>//gc<Left><Left><Left>",  {silent=true, noremap=true})
-- search for all instance of highlighted text
vim.api.nvim_set_keymap("v", "<Leader>sh", "/<C-R>=escape(@', '/\')<CR>",  {silent=true, noremap=true})

-- buffer management
vim.api.nvim_set_keymap("n", "<leader>B", ":buffers <CR>:b<space>",  {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>xb", ":bp|bd #<CR>",  {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>xB", ":bd <CR>", {silent=true, noremap=true})

-- terminal remap
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {silent=true, noremap=true})


-- Movement Mappings
--onoremap i: :<c-u>normal! t:vT:<cr>

-- Insert Mode Tabbing
--inoremap <C-h> <C-d>, {silent=true, noremap=true})
--inoremap <C-l> <C-t>, {silent=true, noremap=true})
