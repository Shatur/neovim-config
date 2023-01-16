require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    toggleterm = 'filetype',
    fugitive = 'filetype',
    notify = 'filetype',
    fugitiveblame = 'filetype',
    ['neo-tree'] = 'filetype',
  },
  bufname = {
    ['DAP *'] = 'bufnr',
  },
})
