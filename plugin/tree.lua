local tree_cb = require('nvim-tree.config').nvim_tree_callback
local nvim_tree = require('nvim-tree')

vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_show_icons = {
  git = 0, -- Causes slowdown
  folders = 1,
  files = 1,
}
vim.g.nvim_tree_icons = {
  default = '',
}

nvim_tree.setup({
  disable_netrw = true,
  update_cwd = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  actions = {
    open_file = {
      window_picker = {
        exclude = {
          filetype = { 'fugitive', 'qf', 'dap-repl', 'notify', 'dapui_watches', 'dapui_stacks', 'dapui_breakpoints', 'dapui_scopes' },
          buftype = { 'terminal' },
        },
      },
    },
  },
  view = {
    mappings = {
      list = {
        { key = 'l', cb = tree_cb('edit') },
        { key = 'h', cb = tree_cb('close_node') },
      },
    },
  },
})

vim.keymap.set('', '<A-f>', function()
  nvim_tree.find_file(true)
  nvim_tree.focus()
end, { noremap = true })
