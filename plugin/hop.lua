local hop = require('hop')

hop.setup()

vim.keymap.set('', '<Leader>w', hop.hint_words, { noremap = true })
vim.keymap.set('', '<Leader>/', hop.hint_patterns, { noremap = true })
vim.keymap.set('', '<Leader>d', hop.hint_lines, { noremap = true })
vim.keymap.set('', '<Leader>s', hop.hint_char1, { noremap = true })
vim.keymap.set('', '<Leader>S', hop.hint_char2, { noremap = true })
