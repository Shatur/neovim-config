require('neogit').setup{
  disable_commit_confirmation = true,
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
