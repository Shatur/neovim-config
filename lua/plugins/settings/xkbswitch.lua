vim.g.XkbSwitchEnabled = true
vim.g.XkbSwitchNLayout = 'us'
vim.g.XkbSwitchSkipGhKeys = {'gh', 'gH'}

if vim.fn.has('win32') == 1 then
  vim.g.XkbSwitchLib = 'C:/Users/Shatur/AppData/Local/nvim-data/libxkbswitch32.dll' 
end
