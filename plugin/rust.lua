local rust = require('rust')

rust.setup({
  dap_open_command = require('dapui').open,
})
