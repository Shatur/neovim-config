vim.api.nvim_command('setlocal spell')
for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
  if vim.api.nvim_buf_get_option(buffer, 'filetype') == 'fugitive' then
    require('stickybuf').pin_filetype()
    break
  end
end
