if vim.g.started_by_firenvim == true then
  return
end

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
  playground = {
    enable = true
  }
}
