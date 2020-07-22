local M = {}

function M.switch_to_normal_buffer()
  local current_buffer = vim.fn.winnr()
  while M.is_small_buffer() do
      vim.api.nvim_command('wincmd w')
      if current_buffer == vim.fn.winnr() then
        -- To avoid infinity loop
        vim.api.nvim_command('only')
        break
      end
  end
end

function M.is_small_buffer()
  return vim.bo.filetype == 'fern' or vim.bo.filetype == 'qf' or vim.bo.filetype == 'vista' or vim.bo.filetype == 'help' or vim.bo.filetype == 'fugitive' or vim.bo.filetype == 'gitcommit' or vim.bo.filetype == 'dap-repl'
end

return M
