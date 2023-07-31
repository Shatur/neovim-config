local neogit = require('neogit')

neogit.setup({
  disable_hint = true,
  disable_builtin_notifications = true,
  kind = 'vsplit',
  signs = {
    section = { '', '' },
    item = { '', '' },
  },
})

vim.keymap.set('', '<Leader>gg', neogit.open, { noremap = true, desc = 'Open Neogit' })
