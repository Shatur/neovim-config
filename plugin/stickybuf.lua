require('stickybuf').setup({
  filetype = {
    startuptime = 'filetype',
    NeogitCommitView = 'filetype',
  },
  bufname = {
    ['.*NEOGIT_COMMIT_EDITMSG'] = 'bufnr',
    ['DAP *.'] = 'bufnr',
  },
})
