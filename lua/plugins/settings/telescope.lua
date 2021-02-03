require('telescope').setup{
  defaults = {
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
        ["<C-v>"] = false,
        ["<C-x>"] = require('telescope.actions').goto_file_selection_vsplit
      }
    }
  }
}

vim.api.nvim_set_keymap('n', '<A-b>', '<Cmd>Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Telescope spell_suggest<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-CR>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F1>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-s>', '<Cmd>Telescope keymaps<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-s>', '<Cmd>Telescope keymaps<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep<CR>', { noremap = true })
if vim.fn.has('win32') then
  vim.api.nvim_set_keymap('', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
else
  vim.api.nvim_set_keymap('', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope current_buffer_fuzzy_find<CR>', { noremap = true })
end
