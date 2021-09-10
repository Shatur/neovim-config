require('stickybuf').setup({
  buftype = {
    terminal = 'buftype',
  },
  filetype = {
    spectre_panel = 'filetype',
  },
  bufname = {
    ['.*NEOGIT_COMMIT_EDITMSG'] = 'bufnr',
    ['DAP *.'] = 'bufnr',
  },
})
