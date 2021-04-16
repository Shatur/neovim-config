vim.g.asyncrun_open = 10
vim.g.asyncrun_rootmarks = {'.git', '.compile_commands.json'}

vim.api.nvim_set_keymap('', '<C-t>', '<Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc><Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-BS>', '<Cmd>AsyncStop<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-BS>', '<Esc><Cmd>AsyncStop<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>rcd', '<Cmd>execute "cd " . asyncrun#get_root("%")<CR>', { noremap = true })
