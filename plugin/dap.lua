require('dapui').setup({
  sidebar = {
    size = 55,
    position = 'right',
  },
  tray = {
    size = 15,
  },
})

local dap = require('dap')

dap.adapters.cpp = {
  type = 'executable',
  attach = {
    pidProperty = 'pid',
    pidSelect = 'ask',
  },
  command = 'lldb-vscode',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES',
  },
  name = 'lldb',
}

vim.g.dap_virtual_text = true

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'LspDiagnosticsDefaultError' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'LspDiagnosticsDefaultInformation' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
vim.fn.sign_define('DapBreakpointRejected', { text = '' })

vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-F11>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F11>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-F11>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F12>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F12>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<S-F12>', '<Cmd>lua require("dap").pause()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F12>', '<Cmd>lua require("dap").pause()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<S-F12>', '<Cmd>lua require("dap").pause()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>B', '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', '<Cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-d>', '<Cmd>lua require("dapui").toggle()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-BS>', '<Cmd>lua require("dap").repl.close(); require("dapui").close(); require("dap").terminate()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-BS>', '<Cmd>lua require("dap").repl.close(); require("dapui").close(); require("dap").terminate()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-BS>', '<Cmd>lua require("dap").repl.close(); require("dapui").close(); require("dap").terminate()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<A-l>', '<Cmd>lua require("dapui").eval()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-l>', '<Cmd>lua require("dapui").eval()<CR>', { noremap = true })
