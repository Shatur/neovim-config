require('gitsigns').setup({
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '▎' },
    topdelete = { text = '▔' },
    changedelete = { text = '▋' },
  },
  preview_config = {
    border = 'rounded',
  },
})
