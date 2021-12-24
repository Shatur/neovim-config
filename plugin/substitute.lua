vim.api.nvim_set_keymap('n', 's', '<Cmd>lua require("substitute").operator()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ss', '<Cmd>lua require("substitute").line()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'S', '<Cmd>lua require("substitute").eol()<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', 's', '<Cmd>lua require("substitute").visual()<CR>', { noremap = true })
