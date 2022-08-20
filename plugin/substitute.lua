local substitute = require('substitute')

vim.keymap.set('n', '<Leader>s', substitute.operator, { noremap = true })
vim.keymap.set('n', '<Leader>ss', substitute.line, { noremap = true })
vim.keymap.set('n', '<Leader>S', substitute.eol, { noremap = true })
vim.keymap.set('x', 'p', substitute.visual, { noremap = true })
