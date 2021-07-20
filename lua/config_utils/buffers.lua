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

  -- To avoid conflicts with stickybuf.nvim, read more here: https://github.com/stevearc/stickybuf.nvim/issues/1#issuecomment-880107698
  if vim.endswith(vim.fn.bufname(), 'NEOGIT_COMMIT_EDITMSG') then
    vim.cmd('close')
    return
  end

  if stickybuf_util.is_sticky_win() then
    vim.api.nvim_buf_delete(buffer, { force = force or vim.bo.buftype == 'terminal' })
    return
  end

  if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
    -- Only one window left, create a new empty window
    vim.cmd('enew')
    vim.bo.bufhidden = 'wipe'
  elseif vim.api.nvim_win_get_buf(0) == buffer then
    -- Preserve layout only if this is a current buffer
    vim.cmd('bprevious')
  end

  vim.cmd('bdelete' .. (force and '! ' or ' ') .. buffer)
end

return buffers
