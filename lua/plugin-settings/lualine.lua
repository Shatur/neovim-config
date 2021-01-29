vim.cmd('packadd lualine.nvim')

local lualine = require('lualine')
lualine.theme = 'onedark'
lualine.extensions = { 'fzf' }
lualine.status()
