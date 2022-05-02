local neo_tree_command = require('neo-tree.command')
local stickybuf_util = require('stickybuf.util')

local function close_current_buffer(command)
  local bang = command and command.bang
  local buffer = tonumber(command and command.args) -- Can be passed as string from command
  if buffer == 0 or not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  if vim.api.nvim_buf_get_option(buffer, 'modified') and not bang then
    vim.notify('No write since last change for buffer ' .. buffer .. '\nAdd ! to override', vim.log.levels.ERROR, { title = 'Buffer' })
    return
  end

  if vim.bo.buftype == 'terminal' then
    vim.api.nvim_command('close')
    return
  end

  if vim.api.nvim_buf_get_option(buffer, 'filetype') == 'neo-tree' then
    neo_tree_command.execute({ action = 'close' })
    return
  end

  if stickybuf_util.is_sticky_win() then
    vim.api.nvim_buf_delete(buffer, { force = bang })
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
    vim.api.nvim_command('bdelete' .. (bang and '!' or '') .. ' ' .. buffer)
  end
end

local function toggle_quickfix()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.api.nvim_command('cclose')
      return
    end
  end
  vim.api.nvim_command('copen')
end

vim.api.nvim_create_user_command('Cftoggle', toggle_quickfix, { desc = 'Toggle quickfix list' })
vim.api.nvim_create_user_command('BDelete', close_current_buffer, { nargs = '?', bang = true, desc = 'Delete buffer with saving the current layout (except special buffers)' })

vim.keymap.set('', '<C-q>', close_current_buffer, { noremap = true })
vim.keymap.set({ 'i', 't' }, '<C-q>', function()
  vim.api.nvim_input('<Esc>')
  close_current_buffer()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<C-x>', function()
  vim.api.nvim_command('write')
  close_current_buffer()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F3>', toggle_quickfix, { noremap = true })
