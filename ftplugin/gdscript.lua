vim.bo.formatoptions = vim.bo.formatoptions:gsub('cro', '')
vim.bo.colorcolumn = 80
vim.cmd('setlocal nowrap')
vim.bo.cinkeys = vim.bo.cinkeys:gsub('0#', '')
vim.bo.indentkeys = vim.bo.indentkeys:gsub('0#', '')
vim.bo.suffixesadd = '.gd'
vim.bo.commentstring = '#\\ %s'
vim.bo.expandtab = false
