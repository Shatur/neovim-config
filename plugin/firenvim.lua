if vim.g.started_by_firenvim ~= true then
  return
end

vim.g.laststatus = 0
vim.g.showtabline = 0

vim.g.firenvim_config = {
  globalSettings = {
    alt = 'all',
  },
  localSettings = {
    ['.*'] = {
      cmdline = 'firenvim',
      takeover = 'never',
    },
  },
}

vim.api.nvim_set_keymap('n', '<Esc><Esc>', '<Cmd>call firenvim#focus_page()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-z>', '<Cmd>write<CR><Cmd>call firenvim#hide_frame()<CR>', { noremap = true })
