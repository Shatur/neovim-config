vim.g.gitgutter_sign_added = '▎'
vim.g.gitgutter_sign_modified = '▎'
vim.g.gitgutter_sign_removed = '▎'
vim.g.gitgutter_sign_removed_first_line = '▔'
vim.g.gitgutter_sign_modified_removed = '▋'

vim.api.nvim_set_keymap('n', '<Leader>hr', '<Plug>(GitGutterUndoHunk)', {})
