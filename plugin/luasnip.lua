vim.api.nvim_set_keymap('i', '<C-d>', '<Plug>luasnip-expand-or-jump', {})
vim.api.nvim_set_keymap('i', '<C-f>', '<Plug>luasnip-jump-prev', {})
vim.api.nvim_set_keymap('s', '<C-d>', '<Plug>luasnip-expand-or-jump', { noremap = true })
vim.api.nvim_set_keymap('s', '<C-f>', '<Plug>luasnip-jump-prev', { noremap = true })
