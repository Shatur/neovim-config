require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    toggleterm = 'filetype',
    fugitive = 'filetype',
    fugitiveblame = 'filetype',
    ['neo-tree'] = 'filetype',
  },
  bufname = {
    ['DAP *'] = 'bufnr',
  },
})
