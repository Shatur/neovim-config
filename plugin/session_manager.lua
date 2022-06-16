local session_manager = require('session_manager')

session_manager.setup({
  autosave_ignore_filetypes = {
    'gitcommit',
    'toggleterm',
  },
})

vim.keymap.set({ '', 't', 'i' }, '<A-p>', session_manager.load_session, { noremap = true })
