if vim.api.nvim_win_get_height(0) == 1 then
  -- If the height is 1, then we show the window inside FZF, do not set any options
  return
end

vim.api.nvim_command('wincmd L')
vim.api.nvim_command('vertical resize 82')
vim.api.nvim_command('setlocal winfixwidth')
