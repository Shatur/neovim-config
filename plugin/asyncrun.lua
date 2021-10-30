vim.g.asyncrun_open = 10
vim.g.asyncrun_rootmarks = { '.git', '.compile_commands.json' }

if vim.fn.has('win32') == 1 then
  -- Add MSVC environment modifier
  vim.g.asyncrun_program = vim.empty_dict()
  vim.api.nvim_command('let g:asyncrun_program.vcvars64 = { opts -> \'"C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Auxiliary/Build/vcvars64.bat" && \' .. opts.cmd }')
end

vim.api.nvim_set_keymap('', '<F3>', '<Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F3>', '<Esc><Cmd>call asyncrun#quickfix_toggle(10)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>rcd', '<Cmd>execute "cd " . asyncrun#get_root("%")<CR>', { noremap = true })
