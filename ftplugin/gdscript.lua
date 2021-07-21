vim.cmd('setlocal nowrap')
vim.bo.cinkeys = vim.bo.cinkeys:gsub('0#', '')
vim.bo.indentkeys = vim.bo.indentkeys:gsub('0#', '')
vim.bo.suffixesadd = '.gd'
vim.bo.commentstring = '#\\ %s'
