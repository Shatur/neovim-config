local yabs = require('yabs')

yabs:setup({
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

vim.keymap.set('', '<A-t>', require('telescope').extensions.yabs.tasks, { noremap = true })
vim.keymap.set('', '<Leader>r', function()
  yabs:run_task('run')
end, { noremap = true })
vim.keymap.set('', '<Leader>t', function()
  yabs:run_task('test')
end, { noremap = true })
vim.keymap.set('', '<C-b>', function()
  yabs:run_task('build')
end, { noremap = true })
