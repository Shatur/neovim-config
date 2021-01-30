vim.g.EasyMotion_verbose = false

vim.api.nvim_set_keymap('', '<Leader>', '<Plug>(easymotion-prefix)', {})
vim.api.nvim_set_keymap('', '<Leader>l', '<Plug>(easymotion-repeat)', {})
vim.api.nvim_set_keymap('', '<Leader>J', '<Plug>(easymotion-eol-j)', {})
vim.api.nvim_set_keymap('', '<Leader>K', '<Plug>(easymotion-eol-K)', {})
