local neogen = require('neogen')

neogen.setup({
  enabled = true,
})

vim.keymap.set('n', '<Leader>n', neogen.generate, { noremap = true, desc = 'Generate documentation' })
