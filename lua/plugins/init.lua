require('plugins.settings.easymotion')
require('plugins.settings.xkbswitch')
require('plugins.settings.swap')
require('plugins.settings.subversive')

vim.cmd('packadd! vim-cool')

if vim.fn.exists('g:vscode') == 1 then
  require('plugins.settings.vscode')
  vim.cmd('packadd! vscode-easymotion')
  return
end

-- Colorscheme (should be initialized before other things)
vim.cmd('colorscheme codedark')

vim.cmd('packadd! nvim-autopairs')
require('plugins.settings.autopairs')

require('plugins.settings.asyncrun')
require('plugins.settings.visual-multi')
require('plugins.settings.open-browser')

vim.cmd('packadd! vim-easymotion')
vim.cmd('packadd! nvim-cursorline')
vim.cmd('packadd! vim-commentary')
vim.cmd('packadd! scroll.vim')
vim.cmd('packadd! vim-visual-star-search')
vim.cmd('packadd! asyncrun.vim')
vim.cmd('packadd! vim-visual-multi')
vim.cmd('packadd! open-browser.vim')
vim.cmd('packadd! open-browser-github.vim')

if vim.fn.exists('g:started_by_firenvim') == 1 then
  require('plugins.settings.firenvim')
  vim.cmd('packadd! firenvim')
  return
end

vim.cmd('packadd! nvim-treesitter')
require('plugins.settings.treesitter')

vim.cmd('packadd! nvim-web-devicons')
vim.cmd('packadd! nvim-bufferline.lua')
require('plugins.settings.bufferline')

vim.cmd('packadd lualine.nvim')
require('plugins.settings.lualine')

vim.cmd('packadd! popup.nvim')
vim.cmd('packadd! plenary.nvim')
vim.cmd('packadd! telescope.nvim')
require('plugins.settings.telescope')

require('plugins.settings.terminal-help')
require('plugins.settings.fern')
require('plugins.settings.nerdfont')
require('plugins.settings.gitgutter')
require('plugins.settings.fugitive')
require('plugins.settings.completion')

vim.cmd('packadd! completion-nvim')
vim.cmd('packadd! completion-buffers')
vim.cmd('packadd! vim-terminal-help')
vim.cmd('packadd! vim-startify')
vim.cmd('packadd! conflict-marker.vim')
vim.cmd('packadd! glyph-palette.vim')
vim.cmd('packadd! vim-eunuch')
vim.cmd('packadd! vim-scriptease')
vim.cmd('packadd! vim-lastplace')
vim.cmd('packadd! quickfix-reflector.vim')
vim.cmd('packadd! fern.vim')
vim.cmd('packadd! nerdfont.vim')
vim.cmd('packadd! fern-renderer-nerdfont.vim')
vim.cmd('packadd! fern-hijack.vim')
vim.cmd('packadd! vim-gitgutter')
vim.cmd('packadd! vim-fugitive')
