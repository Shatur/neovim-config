vim.cmd('packadd lualine.nvim')

local lualine = require('lualine')
lualine.theme = 'codedark'
lualine.extensions = { 'fzf' }
lualine.status()
