require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  ignore_install = { 'tsx' }, -- Has problems extracting an archive on Windows
  highlight = {
    enable = true
  },
  rainbow = {
    enable = true
  },
  playground = {
    enable = true
  }
}
