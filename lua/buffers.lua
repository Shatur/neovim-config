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
  return not vim.api.nvim_buf_get_option(0, 'modifiable') or
    vim.bo.filetype == 'gitrebase' or
    vim.bo.filetype == 'gitcommit' or
    vim.bo.filetype == 'qf'
end


return M
