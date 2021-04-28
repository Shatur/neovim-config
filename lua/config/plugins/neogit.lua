require('neogit').setup{
  signs = {
    section = {'', ''},
    item = {'', ''},
    hunk = {'', '▾'},
  }
}

vim.api.nvim_set_keymap('n', '<A-g>', '<Cmd>Neogit kind=vsplit<CR>', { noremap = true })
