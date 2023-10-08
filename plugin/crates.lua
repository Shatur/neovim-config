require('crates').setup({
  src = {
    cmp = {
      enabled = true,
    },
  },
  null_ls = {
    enabled = true,
    name = 'crates.nvim',
  },
})
