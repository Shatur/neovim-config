if vim.g.started_by_firenvim == true then
  return
end

require('gitsigns').setup {
  signs = {
    add = {text = '▎'},
    change = {text = '▎'},
    delete = {text = '▎'},
    topdelete = {text = '▔'},
    changedelete = {text = '▋'}
  }
}
