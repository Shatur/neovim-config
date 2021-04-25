vim.api.nvim_set_keymap('n', '<A-/>', '<Cmd>lua require("spectre").open()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-/>', '<Cmd>lua require("spectre").open()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-/>', '<Cmd>lua require("spectre").open_visual()<CR>', { noremap = true })
