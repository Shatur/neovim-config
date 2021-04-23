require('compe').setup{
  source = {
    buffer = {
      menu = ' Buffer',
    },
    nvim_lsp = true,
    nvim_lua = true,
    luasnip = true
  }
}

-- luaeval is used because of this issue: https://github.com/neovim/neovim/issues/13862
vim.api.nvim_set_keymap('i', '<CR>', [[luaeval('require("utils.completion").confirm()')]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, expr = true, silent = true })
