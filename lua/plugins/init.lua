require('plugins.settings.easymotion')
require('plugins.settings.xkbswitch')
require('plugins.settings.swap')
require('plugins.settings.subversive')

if vim.fn.exists('g:vscode') == 1 then
  vim.cmd('packadd! vscode-easymotion')
  require('plugins.settings.vscode')
  return
end

vim.cmd('packadd! asyncrun.vim')
vim.cmd('packadd! kommentary')
vim.cmd('packadd! nvim-autopairs')
vim.cmd('packadd! nvim-cursorline')
vim.cmd('packadd! open-browser-github.vim')
vim.cmd('packadd! open-browser.vim')
vim.cmd('packadd! scroll.vim')
vim.cmd('packadd! vim-cool')
vim.cmd('packadd! vim-easymotion')
vim.cmd('packadd! vim-visual-multi')
vim.cmd('packadd! vim-visual-star-search')
vim.cmd('packadd! zephyr-nvim')

require('zephyr') -- Colorscheme

require('plugins.settings.asyncrun')
require('plugins.settings.autopairs')
require('plugins.settings.cursorline')
require('plugins.settings.kommentary')
require('plugins.settings.open-browser')
require('plugins.settings.visual-multi')

if vim.fn.exists('g:started_by_firenvim') == 1 then
  vim.cmd('packadd! firenvim')
  require('plugins.settings.firenvim')
  return
end

vim.cmd('packadd! conflict-marker.vim')
vim.cmd('packadd! gitsigns.nvim')
vim.cmd('packadd! glyph-palette.vim')
vim.cmd('packadd! lualine.nvim')
vim.cmd('packadd! neogit')
vim.cmd('packadd! nvim-bufferline.lua')
vim.cmd('packadd! nvim-compe')
vim.cmd('packadd! nvim-tree.lua')
vim.cmd('packadd! nvim-treesitter')
vim.cmd('packadd! nvim-ts-rainbow')
vim.cmd('packadd! nvim-web-devicons')
vim.cmd('packadd! plenary.nvim')
vim.cmd('packadd! popup.nvim')
vim.cmd('packadd! quickfix-reflector.vim')
vim.cmd('packadd! telescope-project.nvim')
vim.cmd('packadd! telescope.nvim')
vim.cmd('packadd! vim-eunuch')
vim.cmd('packadd! vim-lastplace')
vim.cmd('packadd! vim-scriptease')
vim.cmd('packadd! vim-terminal-help')

require('plugins.settings.bufferline')
require('plugins.settings.compe')
require('plugins.settings.gitsigns')
require('plugins.settings.lualine')
require('plugins.settings.neogit')
require('plugins.settings.telescope')
require('plugins.settings.terminal-help')
require('plugins.settings.tree')
require('plugins.settings.treesitter')
