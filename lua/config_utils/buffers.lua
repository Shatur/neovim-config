local buffers = {}
local stickybuf_util = require('stickybuf.util')

function buffers.close_current_buffer()
  if vim.api.nvim_buf_get_option(0, 'filetype') == 'NvimTree' then
    require('nvim-tree').close()
    return
  end
  if stickybuf_util.is_sticky_win() then
    vim.api.nvim_buf_delete(0, {force = vim.bo.buftype == 'terminal'})
    return
  end
  local current_buffer = vim.fn.bufnr()
  if #vim.fn.getbufinfo({buflisted = 1}) == 1 then
    vim.cmd('enew')
    vim.bo.bufhidden = 'wipe'
  else
    vim.cmd('bprevious')
  end
  vim.cmd('bdelete ' .. current_buffer)
end

return buffers
