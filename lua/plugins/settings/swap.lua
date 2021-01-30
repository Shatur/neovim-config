vim.g.swap_no_default_key_mappings = true

vim.api.nvim_set_keymap('n', '<Leader>i', '<Plug>(swap-interactive)', {})
vim.api.nvim_set_keymap('x', '<Leader>i', '<Plug>(swap-interactive)', {})
vim.api.nvim_set_keymap('n', '<Leader>i', '<Plug>(swap-prev)', {})
vim.api.nvim_set_keymap('n', '<Leader>i', '<Plug>(swap-next)', {})
