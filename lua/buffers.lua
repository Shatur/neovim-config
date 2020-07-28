local M = {}

function M.switch_to_normal_buffer()
  local current_buffer = vim.fn.winnr()
  while M.is_special_buffer() do
      vim.api.nvim_command('wincmd w')
      if current_buffer == vim.fn.winnr() then
        -- To avoid infinity loop
        vim.api.nvim_command('only')
        break
      end
  end
end

function M.is_special_buffer()
  return vim.bo.filetype == 'startuptime' or vim.bo.filetype == 'fern' or vim.bo.filetype == 'qf' or vim.bo.filetype == 'vista_markdown' or vim.bo.filetype == 'vista' or vim.bo.filetype == 'help' or vim.bo.filetype == 'fugitive' or vim.bo.filetype == 'gitcommit' or vim.bo.filetype == 'dap-repl'
end

function M.close_current_buffer()
  if M.is_special_buffer() then
    vim.api.nvim_command('bdelete')
    return
  end
  local current_buffer = vim.fn.bufnr()
  if #vim.fn.getbufinfo({buflisted=1}) == 1 then
    vim.api.nvim_command('enew')
    vim.bo.bufhidden = 'wipe'
  else
    vim.api.nvim_command('bprevious')
  end
  vim.api.nvim_command('bdelete ' .. current_buffer)
end

function M.close_other_buffers()
  local current_bufnr = vim.fn.bufnr()
  local buffers_info = vim.fn.getbufinfo()
  for _, buffer in ipairs(buffers_info) do
    local bufnr = buffer['bufnr']
    if bufnr ~= current_bufnr then
      vim.api.nvim_command('bdelete ' .. bufnr)
    end
  end
end

return M
