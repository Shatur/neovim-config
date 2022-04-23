require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    toggleterm = 'filetype',
    fugitive = 'filetype',
    fugitiveblame = 'filetype',
  },
  bufname = {
    ['DAP *'] = 'bufnr',
  },
})
