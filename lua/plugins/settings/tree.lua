vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}

vim.g.nvim_tree_icons = {
  default = ''
}

vim.g.nvim_tree_bindings = {
  ['l'] = '<cmd>lua require"nvim-tree".on_keypress("edit")<CR>',
  ['h'] = '<cmd>lua require"nvim-tree".on_keypress("close_node")<CR>',
}
