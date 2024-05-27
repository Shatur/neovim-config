local stickybuf = require('stickybuf')
local toggleterm = require('toggleterm')

local function close_buffer(command)
  local bang = command and command.bang
  local buffer = tonumber(command and command.args) -- Can be passed as string from command
  if buffer == 0 or not buffer then
    buffer = vim.api.nvim_get_current_buf()
  end

  if vim.api.nvim_buf_get_option(buffer, 'modified') and not bang then
    vim.notify('No write since last change for buffer ' .. buffer .. '\nAdd ! to override', vim.log.levels.ERROR, { title = 'Buffer' })
    return
  end

  -- Never kill toggleterm
  local filettype = vim.api.nvim_buf_get_option(buffer, 'filetype')
  if filettype == 'toggleterm' then
    toggleterm.toggle(1)
    return
  end

  if vim.api.nvim_buf_get_option(buffer, 'buftype'):len() ~= 0 or stickybuf.should_auto_pin(buffer) or filettype == 'NeogitCommitMessage' then
    vim.cmd.quit(command)
    return
  end

  if #vim.fn.getbufinfo({ buflisted = 1 }) == 1 then
    -- Only one window left, create a new empty window
    vim.cmd.enew()
    vim.bo.bufhidden = 'wipe'
  elseif vim.api.nvim_win_get_buf(0) == buffer then
    -- Preserve layout only if this is a current buffer
    vim.cmd.bprevious()
  end

  -- Delete the buffer if it wasn't wiped automatically (via bufhidden)
  if vim.api.nvim_buf_is_loaded(buffer) then
    vim.cmd.bdelete({ buffer, bang = bang })
  end
end

local function toggle_quickfix()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

local function close_other_buffers()
  local current_buffer = vim.api.nvim_get_current_buf()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if buffer ~= current_buffer and not vim.api.nvim_buf_get_option(buffer, 'modified') and vim.api.nvim_buf_get_option(buffer, 'buflisted') then
      vim.cmd.bdelete({ buffer })
    end
  end
  vim.cmd.redrawtabline()
end

vim.keymap.set('', '<C-w>O', close_other_buffers, { noremap = true, desc = 'Close other buffers' })
vim.keymap.set('', '<C-w><A-o>', vim.cmd.tabonly, { noremap = true, desc = 'Close other tabs' })
vim.keymap.set('', '<C-q>', close_buffer, { noremap = true, desc = 'Close current buffer' })
vim.keymap.set({ '', 'v' }, '<Leader><C-q>', function() close_buffer({ bang = true }) end, { noremap = true, desc = 'Force close current buffer' })
vim.keymap.set({ 'i', 't' }, '<C-q>', function()
  vim.api.nvim_input('<Esc>')
  close_buffer()
end, { noremap = true, desc = 'Close current buffer' })
vim.keymap.set({ '', 'i' }, '<C-x>', function()
  vim.api.nvim_input('<Esc>')
  vim.cmd.write()
  close_buffer()
end, { noremap = true, desc = 'Save and close current buffer' })
vim.keymap.set({ '', 'i' }, '<F3>', toggle_quickfix, { noremap = true, desc = 'Toggle quickfix' })
