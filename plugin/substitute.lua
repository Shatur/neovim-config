local substitute = require('substitute')

vim.keymap.set('n', '<Leader>s', substitute.operator, { noremap = true, desc = 'Substitute operator' })
vim.keymap.set('n', '<Leader>ss', substitute.line, { noremap = true, desc = 'Substitute current line' })
vim.keymap.set('n', '<Leader>S', substitute.eol, { noremap = true, desc = 'Substitute until end of line' })
vim.keymap.set('x', 'p', substitute.visual, { noremap = true, desc = 'Substitute selection (paste)' })
