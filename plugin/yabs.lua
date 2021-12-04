require('yabs'):setup({
  languages = {
    lua = {
      tasks = {
        run = {
          command = 'luafile %',
          type = 'vim',
        },
      },
    },
  },
  opts = {
    output_types = {
      quickfix = {
        open_on_run = 'always',
      },
    },
  },
})

vim.api.nvim_set_keymap('', '<A-t>', '<Cmd>Telescope yabs tasks<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>r', '<Cmd>YabsTask run<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>t', '<Cmd>YabsTask test<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-b>', '<Cmd>YabsTask build<CR>', { noremap = true })
