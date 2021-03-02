require('gitsigns').setup {
  signs = {
    add = {hl = 'Comment', text = '▎'},
    change = {hl = 'Constant', text = '▎'},
    delete = {hl = 'ErrorMsg', text = '▎'},
    topdelete = {hl = 'ErrorMsg', text = '▔'},
    changedelete = {hl = 'Constant', text = '▋'}
  }
}
