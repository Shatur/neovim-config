local notify = require('notify')
notify.setup({
  top_down = false,
})
vim.notify = notify
