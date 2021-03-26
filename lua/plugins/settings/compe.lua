require('compe').setup{
  source = {
    buffer = {
      menu = 'ﮜ'
    },
    spell = {
      menu = ''
    }
  }
}

-- luaeval is used because of this issue: https://github.com/neovim/neovim/issues/13862
vim.api.nvim_set_keymap('i', '<CR>', [[luaeval('require("utils.completion_autopairs").completion_confirm()')]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', 'compe#close("<C-e>")', { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<Down>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'pumvisible() ? "<Down>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<Up>" : "<S-Tab>"', { expr = true })
vim.api.nvim_set_keymap('s', '<S-Tab>', 'pumvisible() ? "<Up>" : "<S-Tab>"', { expr = true })
