vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_indent_markers = 1
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
require('nvim-tree').setup({
  disable_netrw = true,
  update_cwd = true,
  view = {
    mappings = {
      list = {
        { key = 'l', cb = tree_cb('edit') },
        { key = 'h', cb = tree_cb('close_node') },
      },
    },
  },
})

vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })
