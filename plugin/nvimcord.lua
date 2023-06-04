require('nvimcord').setup({
  autostart = true,
  large_file_icon = false,
  log_level = vim.log.levels.ERROR,
})

local discord = require('nvimcord.discord')
vim.api.nvim_create_autocmd('DirChanged', {
  callback = function(event) discord.config.workspace_name = vim.fs.basename(event.file) end,
  group = 'Config',
})
