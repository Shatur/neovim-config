local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    file_sorter =  require('telescope.sorters').get_fzy_sorter,
    mappings = {
      i = {
        ['<C-v>'] = false,
        ['<C-x>'] = actions.select_vertical,
        ['<C-q>'] = actions.close,
        ['<C-CR>'] = actions.smart_send_to_qflist + actions.open_qflist,
      }
    }
  }
}

telescope.load_extension('project')
telescope.load_extension('dap')

vim.api.nvim_set_keymap('n', '<A-b>', '<Cmd>Telescope git_branches theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope project theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Telescope spell_suggest theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-CR>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope commands theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope commands theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F1>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope help_tags theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope help_tags theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-o>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-o>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
if vim.fn.has('win32') then
  vim.api.nvim_set_keymap('', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown<CR>', { noremap = true })
else
  vim.api.nvim_set_keymap('', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown<CR>', { noremap = true })
end
