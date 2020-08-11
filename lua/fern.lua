local M = {}

function M.hijack_directory()
  if vim.fn.isdirectory(vim.fn.expand('%')) == 0 then
    return
  end
  vim.api.nvim_command('Fern %')
end

return M
