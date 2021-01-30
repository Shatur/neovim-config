vim.g.one_allow_italics = true

vim.cmd('colorscheme one')

vim.call('one#highlight', 'DiffRemoved', '', 'bg', '')
vim.call('one#highlight', 'DiffAdded', '', 'bg', '')
vim.call('one#highlight', 'Constant', '56b6c2', '', '')
