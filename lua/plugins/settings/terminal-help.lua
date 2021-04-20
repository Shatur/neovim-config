vim.g.terminal_default_mapping = false
vim.g.terminal_list = false
vim.g.terminal_height = 15
vim.g.terminal_fixheight = true
vim.g.terminal_shell = 'powershell'

vim.api.nvim_set_keymap('', '<F4>', '<Cmd>call TerminalToggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F4>', '<Esc><Cmd>call TerminalToggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<F4>', '<Cmd>call TerminalToggle()<CR>', { noremap = true })
