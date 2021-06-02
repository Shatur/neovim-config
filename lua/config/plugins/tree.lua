vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_show_icons = {
  git = 0, -- Causes slowdown
  folders = 1,
  files = 1,
}
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {'qf', 'gitstatus'},
  buftype = {'terminal'}
}

vim.g.nvim_tree_icons = {
  default = '',
}

vim.g.nvim_tree_bindings = {
  ['l'] = '<Cmd>lua require"nvim-tree".on_keypress("edit")<CR>',
  ['h'] = '<Cmd>lua require"nvim-tree".on_keypress("close_node")<CR>',
}
