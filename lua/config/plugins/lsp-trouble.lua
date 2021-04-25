vim.api.nvim_set_keymap('', '<S-F3>', '<Cmd>LspTroubleDocumentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F3>', '<Cmd>LspTroubleDocumentToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-F3>', '<Cmd>LspTroubleWorkspaceToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F3>', '<Cmd>LspTroubleWorkspaceToggle<CR>', { noremap = true })
