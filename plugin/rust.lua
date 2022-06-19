local rust = require('rust')

rust.setup({
  dap_open_command = require('dapui').open,
})

vim.keymap.set({ '', 'i' }, '<A-r>', function()
  rust.cargo('run')
end, { noremap = true })

vim.keymap.set({ '', 'i' }, '<A-t>', function()
  rust.cargo('test')
end, { noremap = true })

vim.keymap.set('', '<Leader><M-r>', function()
  rust.debug('run')
end, { noremap = true })

vim.keymap.set('', '<Leader><M-t>', function()
  rust.debug('test')
end, { noremap = true })
