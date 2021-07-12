local buffers = {}
local stickybuf_util = require('stickybuf.util')

function buffers.close_current_buffer(buffer, force)
  buffer = tonumber(buffer) -- Can be passed as string from command
  if buffer == 0 or not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  if vim.api.nvim_buf_get_option(buffer, 'filetype') == 'NvimTree' then
    require('nvim-tree').close()
    return
  end

  if stickybuf_util.is_sticky_win() then
    vim.api.nvim_buf_delete(buffer, {force = force or vim.bo.buftype == 'terminal'})
    return
  end

  if #vim.fn.getbufinfo({buflisted = 1}) == 1 then
    vim.cmd('enew')
    vim.bo.bufhidden = 'wipe'
  else
    vim.cmd('bprevious')
  end

  vim.cmd('bdelete ' .. (force and '! ' or ' ') ..  buffer)
end

return buffers
