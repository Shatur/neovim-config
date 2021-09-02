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
vim.fn.sign_define('DapStopped', { text = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '' })

vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-F11>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-F12>', '<Cmd>lua require("dap").pause()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>B', '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>lp', '<Cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-d>', '<Cmd>lua require("dap").repl.toggle({height = 15})<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-BS>', '<Cmd>lua require("dap").disconnect(); require("dap").repl.close()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>p', '<Cmd>Telescope dap list_breakpoints theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>c', '<Cmd>Telescope dap commands theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>v', '<Cmd>Telescope dap variables theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<Cmd>Telescope dap frames theme=get_dropdown<CR>', { noremap = true })
