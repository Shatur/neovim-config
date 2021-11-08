require('neogen').setup({
  enabled = true,
})

vim.api.nvim_set_keymap('n', '<Leader>nf', "<Cmd>lua require('neogen').generate()<CR>", { noremap = true })
