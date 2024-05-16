local dap, dapui = require("dap"), require("dapui")

-- Dap Python Config: NOTE require'dap'.setup() is called in the following command
require('dap-python').setup(os.getenv("PYTHON_PROG3"))

--require('dap').configurations.python = {{
  --type = 'python',
  --request = 'launch',
  --name = 'CustomLaunch',
  --program = '${file}',
  --justMyCode = false,
--},}

dap.adapters.bashdb = {
  type = 'executable';
  command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
  name = 'bashdb';
}

dap.configurations.sh = {
  {
    type = 'bashdb';
    request = 'launch';
    name = "Launch File Without Arguments";
    showDebugOutput = true;
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
    trace = true;
    file = "${file}";
    program = "${file}";
    cwd = '${workspaceFolder}';
    pathCat = "cat";
    pathBash = "/bin/bash";
    pathMkfifo = "mkfifo";
    pathPkill = "pkill";
    args = {};
    env = {};
    terminalKind = "integrated";
  }
}
-- Configuration that takes args
table.insert(dap.configurations.sh,
  {
    type = 'bashdb';
    request = 'launch';
    name = "Launch File With Arguments";
    showDebugOutput = true;
    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb';
    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir';
    trace = true;
    file = "${file}";
    program = "${file}";
    cwd = '${workspaceFolder}';
    pathCat = "cat";
    pathBash = "/bin/bash";
    pathMkfifo = "mkfifo";
    pathPkill = "pkill";
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end;
    env = {};
    terminalKind = "integrated";
  }
)

--Virtual Text Setup
local virtual_text_config = {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

-- Dap UI Config & Setup
local dap_ui_config = {
icons = { expanded = "", collapsed = "", current_frame = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
        "repl",
        --"console",
      },
      size = 0.15,
      position = "bottom",
    },
    {
      elements = {
        --"watches",
        "console",
      },
      size = 0.1,
      position = "top",
    },
    {
      elements = {
       --Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "stacks",
        "watches",
      },
      size = 100, -- 100 columns
      position = "left",
    },
    {
      elements = {
       --Elements can be strings or table with id and size keys.
        {id = "repl", size = 0.4},
        {id = "watches", size = 0.4},
        {id = "console", size=0.10},
      },
      size = 100, -- 100 columns
      position = "left",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = false,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "",
      terminate = "",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
}

dapui.setup(dap_ui_config)

vim.api.nvim_create_user_command('Dscopes', 'lua require("dapui").float_element("scopes", {enter=true})', {})
vim.api.nvim_create_user_command('Dstacks', 'lua require("dapui").float_element("stacks", {enter=true})', {})
vim.api.nvim_create_user_command('Dbreaks', 'lua require("dapui").float_element("breakpoints", {enter=true})', {})
vim.api.nvim_create_user_command('Dwatches', 'lua require("dapui").float_element("watches", {enter=true})', {})
vim.api.nvim_create_user_command('Dclose', 'lua require("dapui").close()', {})

--KeyMaps
vim.api.nvim_set_keymap('n', '<space>ee',"<cmd>lua require'dap'.continue()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>en',"<cmd>lua require'dap'.step_over()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>ei',"<cmd>lua require'dap'.step_into()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>eo',"<cmd>lua require'dap'.step_out()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>eb',"<cmd>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>eB',"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {noremap = true})
--vim.api.nvim_set_keymap('n', '<space>fc"',<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" , {noremap = true})
vim.api.nvim_set_keymap('n', '<space>er',"<cmd>lua require'dap'.repl.toggle()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>el',"<cmd>lua require'dap'.run_last()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>ex',"<cmd>lua require'dap'.terminate()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>eX',"<cmd>lua require'dap'.terminate()<CR> <cmd> lua require'dapui'.close()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>e1',"<cmd>lua require'dapui'.close()<CR> <cmd> lua require'dapui'.toggle(3)<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<space>e2',"<cmd>lua require'dapui'.close()<CR> <cmd> lua require'dapui'.toggle(4)<CR>", {noremap = true})


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.toggle(1)
  dapui.toggle(2)
end
--dap.listeners.before.event_terminated["dapui_config"] = function()
  --dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
  --dapui.close()
--end

require('nvim-dap-virtual-text').setup(virtual_text_config)
