if vim.g.started_by_firenvim == true then
  return
end

vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_resize = 0
vim.g.nvim_tree_show_icons = {
  git = 0, -- Causes slowdown
  folders = 1,
  files = 1,
}
vim.g.nvim_tree_window_picker_exclude = {
  filetype = { 'qf', 'gitstatus' },
  buftype = { 'terminal' },
}

vim.g.nvim_tree_icons = {
  default = '',
}

local tree_cb = require('nvim-tree.config').nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = 'l', cb = tree_cb('edit') },
  { key = 'h', cb = tree_cb('close_node') },
}
