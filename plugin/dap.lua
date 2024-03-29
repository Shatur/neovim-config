local dap = require('dap')
local dapui = require('dapui')
local dap_virtual_text = require('nvim-dap-virtual-text')

dap.adapters.lldb = {
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

dapui.setup({
  layouts = {
    {
      elements = {
        'scopes',
        'breakpoints',
        'stacks',
        'watches',
      },
      size = 40,
      position = 'right',
    },
    {
      elements = {
        'repl',
        'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
})

dap_virtual_text.setup()

vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticInfo' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'Constant' })
vim.fn.sign_define('DapBreakpointRejected', { text = '' })

local function run_lldb(command)
  local config = {
    type = 'lldb',
    name = command.fargs[1],
    request = 'launch',
    program = command.fargs[1],
    args = { vim.list_slice(command.fargs, 2, vim.tbl_count(command.fargs)) },
  }

  dap.run(config)
  dap.repl.open()
end

vim.api.nvim_create_user_command('Lldb', run_lldb, { nargs = '+', complete = 'file', desc = 'Run command in LLDB' })

vim.keymap.set({ 'n', 'i', 'v' }, '<F10>', dap.step_over, { noremap = true, desc = 'Step over' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F11>', dap.step_into, { noremap = true, desc = 'Step into' })
vim.keymap.set({ 'n', 'i', 'v' }, '<S-F11>', dap.step_out, { noremap = true, desc = 'Step out' })
vim.keymap.set({ 'n', 'i', 'v' }, '<F12>', dap.continue, { noremap = true, desc = 'Debug continue' })
vim.keymap.set({ 'n', 'i', 'v' }, '<S-F12>', dap.pause, { noremap = true, desc = 'Debug pause' })
vim.keymap.set({ 'n', 'v' }, '<Leader>dd', dapui.toggle, { noremap = true, desc = 'Toggle debug interface' })
vim.keymap.set({ 'n', 'v' }, '<Leader>de', dapui.eval, { noremap = true, desc = 'Evaluate expression in debugger' })

vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { noremap = true, desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<Leader>dB', function()
  vim.ui.input({ prompt = 'Breakpoint condition: ' }, function(condition) dap.set_breakpoint(condition) end)
end, { noremap = true, desc = 'Toggle conditional breakpoint' })
vim.keymap.set('n', '<Leader>dl', function()
  vim.ui.input({ prompt = 'Log point message: ' }, function(message) dap.set_breakpoint(message) end)
end, { noremap = true, desc = 'Toggle log breakpoint' })
