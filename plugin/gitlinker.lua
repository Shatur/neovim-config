local gitlinker = require('gitlinker')
gitlinker.setup()

vim.api.nvim_create_user_command(
  'GitLink',
  function()
    gitlinker.link({
      action = require('gitlinker.actions').system,
      lstart = vim.api.nvim_buf_get_mark(0, '<')[1],
      lend = vim.api.nvim_buf_get_mark(0, '>')[1],
    })
  end,
  {
    range = true,
  }
)
