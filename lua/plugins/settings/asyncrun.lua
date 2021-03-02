-- Git integration
vim.cmd('command! -bang -bar -nargs=* Gpush execute "AsyncRun<bang> git push" <q-args>')
vim.cmd('command! -bang -bar -nargs=* Gfetch execute "AsyncRun<bang> git fetch" <q-args>')
vim.cmd('command! -bang -bar -nargs=* Gpull execute "AsyncRun<bang> git pull" <q-args>')

vim.g.asyncrun_open = 10
vim.g.asyncrun_rootmarks = {'.git', '.compile_commands.json'}

vim.api.nvim_set_keymap('', '<C-t>', '<Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc><Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-BS>', '<Cmd>AsyncStop<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-BS>', '<Esc><Cmd>AsyncStop<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-y>', '<Cmd>Gpull<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-u>', '<Cmd>Gpush<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>rcd', '<Cmd>execute "cd " . asyncrun#get_root("%")<CR>', { noremap = true })
