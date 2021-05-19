require('neogit').setup{
  signs = {
    section = {'', ''},
    item = {'', ''},
    hunk = {'', '▾'},
  },
  integrations = {
    diffview = true
  }
}

vim.api.nvim_set_keymap('n', '<A-g>', '<Cmd>Neogit kind=vsplit<CR>', { noremap = true })
