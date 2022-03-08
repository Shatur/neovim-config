local buffers = {}
local stickybuf_util = require('stickybuf.util')
local nvim_tree_view = require('nvim-tree.view')

function buffers.close_current_buffer(buffer, force)
  buffer = tonumber(buffer) -- Can be passed as string from command
  if buffer == 0 or not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  if vim.api.nvim_buf_get_option(buffer, 'modified') and (not force or #force == 0) then
    vim.notify('No write since last change for buffer ' .. buffer .. '\nAdd ! to override', vim.log.levels.ERROR, { title = 'Buffer' })
    return
  end

  if vim.bo.buftype == 'terminal' then
    vim.api.nvim_command('close')
    return
  end

  if vim.api.nvim_buf_get_option(buffer, 'filetype') == 'NvimTree' then
    nvim_tree_view.close()
    return
  end

  if stickybuf_util.is_sticky_win() then
    vim.api.nvim_buf_delete(buffer, { force = force and #force ~= 0 })
    return
  end

  if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
    -- Only one window left, create a new empty window
    vim.api.nvim_command('enew')
    vim.bo.bufhidden = 'wipe'
  elseif vim.api.nvim_win_get_buf(0) == buffer then
    -- Preserve layout only if this is a current buffer
    vim.api.nvim_command('bprevious')
  end

  -- Delete the buffer if it wasn't wiped automatically (via bufhidden)
  if vim.api.nvim_buf_is_loaded(buffer) then
    vim.api.nvim_command('bdelete' .. force .. ' ' .. buffer)
  end
end

function buffers.toggle_quickfix()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.api.nvim_command('cclose')
      return
    end
  end
  vim.api.nvim_command('copen')
end

return buffers
