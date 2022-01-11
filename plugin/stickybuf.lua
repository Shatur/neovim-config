require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    toggleterm = 'filetype',
    fugitive = 'filetype',
  },
  bufname = {
    ['DAP *'] = 'bufnr',
  },
})
