vim.api.nvim_set_keymap('n', '<A-g>', '<Cmd>G<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gD', '<Cmd>G difftool -y<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Gdiffsplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-u>', '<Cmd>G push<CR>', { noremap = true })
