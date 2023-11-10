local neogit = require('neogit')

neogit.setup({
  disable_hint = true,
  kind = 'vsplit',
  commit_editor = {
    kind = 'split',
  },
  rebase_editor = {
    kind = 'split',
  },
  merge_editor = {
    kind = 'split',
  },
  tag_editor = {
    kind = 'split',
  },
  signs = {
    section = { '', '' },
    item = { '', '' },
  },
})

vim.keymap.set('', '<Leader>gg', neogit.open, { noremap = true, desc = 'Open Neogit' })
