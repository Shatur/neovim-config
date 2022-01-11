require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    toggleterm = 'filetype',
    fugitive = 'filetype',
    git = 'filetype',
  },
  bufname = {
    ['DAP *'] = 'bufnr',
  },
})
