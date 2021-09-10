vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_resize = 0
vim.g.nvim_tree_follow = 0
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_show_icons = {
  git = 0, -- Causes slowdown
  folders = 1,
  files = 1,
}
vim.g.nvim_tree_window_picker_exclude = {
  filetype = { 'qf', 'gitstatus', 'dap-repl', 'notify', 'NeogitStatus', 'dapui_watches', 'dapui_stacks', 'dapui_breakpoints', 'dapui_scopes' },
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
