require("toggleterm").setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true,
  persist_size = false,
  persist_mode = true,
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = nil, -- change the default shell
  float_opts = {
    border = "rounded",
    height = 60,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.count
    end,
  },
}

   -- abstract to function
local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({cmd = "lazygit",
                              hidden = true,
                              on_open = function(term)
                                vim.cmd("startinsert!")
                                vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                              end,
                          })

local nvidia_smi = Terminal:new({cmd = "nvidia-smi",
                                 hidden = true,
                                 on_open = function(term)
                                   vim.cmd("startinsert!")
                                   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                                 end,
                             })

local htop = Terminal:new({cmd = "htop",
                           hidden = true,
                           on_open = function(term)
                             vim.cmd("startinsert!")
                             vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                           end,
                           })

local python = Terminal:new({cmd = "python",
                           hidden = true,
                           on_open = function(term)
                             vim.cmd("startinsert!")
                             vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                           end,
                           })

function T_LAZYGIT()
  lazygit:toggle()
end

function T_HTOP()
  htop:toggle()
end

function T_SMI()
  nvidia_smi:toggle()
end

function T_PYTHON()
  python:toggle()
end

vim.api.nvim_create_user_command('Lazygit', 'lua T_LAZYGIT()', {})
vim.api.nvim_create_user_command('Htop', 'lua T_HTOP()', {})
vim.api.nvim_create_user_command('Smi', 'lua T_SMI()', {})
vim.api.nvim_create_user_command('Python', 'lua T_PYTHON()', {})
