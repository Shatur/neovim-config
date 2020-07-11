local M = {}

function M.switch_to_normal_buffer()
  while M.is_small_buffer() do
      vim.api.nvim_command('wincmd w')
  end
end

function M.is_small_buffer()
  return vim.bo.filetype == 'fern' or vim.bo.filetype == 'qf' or vim.bo.filetype == 'vista' or vim.bo.filetype == 'help' or vim.bo.filetype == 'fugitive' or vim.bo.filetype == 'gitcommit'
end

return M
