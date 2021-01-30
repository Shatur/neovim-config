vim.g.pear_tree_smart_openers = true
vim.g.pear_tree_smart_closers = true
vim.g.pear_tree_smart_backspace = true
vim.g.pear_tree_repeatable_expand = false
vim.g.pear_tree_map_special_keys = false

vim.api.nvim_set_keymap('i', '<BS>', '<Plug>(PearTreeBackspace)', {})
vim.api.nvim_set_keymap('i', '<Esc>', '<Plug>(PearTreeFinishExpansion)', {})
