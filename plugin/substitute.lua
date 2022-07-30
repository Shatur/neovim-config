local substitute = require('substitute')

vim.keymap.set('n', 'm', substitute.operator, { noremap = true })
vim.keymap.set('n', 'mm', substitute.line, { noremap = true })
vim.keymap.set('n', 'R', substitute.eol, { noremap = true })
vim.keymap.set('x', 'p', substitute.visual, { noremap = true })
