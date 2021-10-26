require('stickybuf').setup({
  buftype = {
    terminal = 'buftype',
  },
  filetype = {
    spectre_panel = 'filetype',
    NeogitCommitView = 'filetype',
  },
  bufname = {
    ['.*NEOGIT_COMMIT_EDITMSG'] = 'bufnr',
    ['DAP *.'] = 'bufnr',
  },
})
