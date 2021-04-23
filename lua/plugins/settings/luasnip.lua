require'luasnip'.snippets={
  all = {}
}

vim.api.nvim_set_keymap('i', '<Tab>', [[luaeval('require("utils.completion").tab_snippet()')]], { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[luaeval('require("utils.completion").s_tab_snippet()')]], { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', [[luaeval('require("utils.completion").tab_snippet()')]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', [[luaeval('require("utils.completion").s_tab_snippet()')]], { noremap = true, expr = true })
