vim.g.terminal_default_mapping = false
vim.g.terminal_list = false
vim.g.terminal_height = 15
vim.g.terminal_fixheight = true

vim.api.nvim_set_keymap('', '<A-t>', '<Cmd>call TerminalToggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-t>', '<Esc><Cmd>call TerminalToggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-t>', '<Cmd>call TerminalToggle()<CR>', { noremap = true })
