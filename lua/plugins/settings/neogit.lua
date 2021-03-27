require('neogit').setup{
  disable_context_highlighting = true,
  signs = {
    section = {'', ''},
    item = {'', ''},
    hunk = {'', '▾'},
  }
}

vim.api.nvim_set_keymap('n', '<A-g>', '<Cmd>Neogit kind=vsplit<CR>', { noremap = true })
