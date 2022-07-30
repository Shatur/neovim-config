local substitute = require('substitute')

vim.keymap.set('n', '<Leader>r', substitute.operator, { noremap = true })
vim.keymap.set('n', '<Leader>rr', substitute.line, { noremap = true })
vim.keymap.set('n', '<Leader>R', substitute.eol, { noremap = true })
vim.keymap.set('x', 'p', substitute.visual, { noremap = true })
