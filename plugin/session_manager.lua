local session_manager = require('session_manager')

session_manager.setup({
  autosave_ignore_filetypes = {
    'gitcommit',
    'toggleterm',
  },
})

vim.keymap.set('', '<Leader>p', session_manager.load_session, { noremap = true, desc = 'Load session' })
