if vim.g.started_by_firenvim == true then
  return
end

require('stickybuf').setup({
  buftype = {
    terminal = 'buftype'
  },
  filetype = {
    spectre_panel = 'filetype'
  }
})
