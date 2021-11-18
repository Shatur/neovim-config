vim.api.nvim_set_keymap('i', '<C-f>', [[<Cmd>lua if require("neogen").jumpable() then require("neogen").jump_next() else require("luasnip").expand_or_jump() end <CR>]], {})
vim.api.nvim_set_keymap('i', '<C-b>', '<Cmd>lua require("luasnip").jump(-1)<CR>', {})
vim.api.nvim_set_keymap('s', '<C-f>', '<Cmd>lua require("luasnip").expand_or_jump()<CR>', {})
vim.api.nvim_set_keymap('s', '<C-b>', '<Cmd>lua require("luasnip").jump(-1)<CR>', {})
