vim.g.fzf_commands_expect = 'alt-enter,ctrl-x'
vim.g.fzf_layout = {
  window = {
    width = 0.9,
    height = 0.6
  }
}

-- Allow passing argumrnts and search only for file content
vim.cmd('command! -bang -nargs=* Find call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .. <q-args>, 1, {"options": "--delimiter : --nth 4.."}, <bang>0)')

vim.cmd('command! Spell call vimrc#fzf#Spell()')
vim.cmd('command! Packages call vimrc#fzf#Packages()')

if vim.fn.has('win32') then
  vim.api.nvim_set_keymap('', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>BLines<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>BLines<CR>', { noremap = true })
else
  vim.api.nvim_set_keymap('', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>BLines<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>BLines<CR>', { noremap = true })
end
vim.api.nvim_set_keymap('', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR>:Find ""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR><Esc>:Find ""<Left>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Files<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>History<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-s>', '<Cmd>Maps<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F1>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Helptags<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-CR>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>gc', '<Cmd>Commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Spell<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>a', '<Cmd>Packages<CR>', { noremap = true })
