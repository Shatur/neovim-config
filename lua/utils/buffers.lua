local M = {}

function M.is_special_buffer()
  return not vim.api.nvim_buf_get_option(0, 'modifiable') or
    vim.bo.filetype == 'gitrebase' or
    vim.bo.filetype == 'gitcommit' or
    vim.bo.filetype == 'qf'
end

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
    if bufnr ~= current_bufnr and not vim.api.nvim_buf_get_option(0, 'modified') then
      vim.api.nvim_command('bdelete ' .. bufnr)
    end
  end
end

return M
