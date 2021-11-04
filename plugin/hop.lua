require('hop').setup()

vim.api.nvim_set_keymap('', '<Leader>w', '<Cmd>HopWord<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>/', '<Cmd>HopPattern<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>d', '<Cmd>HopLine<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>s', '<Cmd>HopChar1<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>S', '<Cmd>HopChar2<CR>', { noremap = true })
