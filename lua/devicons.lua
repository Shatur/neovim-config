local M = {}

function M.set_icon_colors(config, filetypes)
  local joined_filetypes = table.concat(filetypes, ",")
  vim.api.nvim_command('augroup DeviconsColors')
  vim.api.nvim_command('autocmd!')
  for group, icons in pairs(config) do
    vim.api.nvim_command(string.format('autocmd FileType %s syntax match %s /\\v%s./ containedin=ALL', joined_filetypes, group, table.concat(icons, '.|')))
  end
  vim.api.nvim_command('augroup END')
end

return M
