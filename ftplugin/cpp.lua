vim.bo.formatoptions = vim.bo.formatoptions:gsub('cro', '')
vim.bo.cinoptions = vim.bo.cinoptions .. 'L0,j1,(0,ws,Ws'
vim.cmd('setlocal nowrap')
