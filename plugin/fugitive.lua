local Job = require('plenary.job')

local function run_command(command, args)
  local title = 'Running ' .. command .. ' ' .. table.concat(args, ' ')
  local output = ''
  local length = 0
  local notification
  local current_win
  local height

  local on_data = function(_, data)
    if #output ~= 0 then
      output = output .. '\n'
    end
    output = output .. data

    notification = vim.notify(output, vim.log.levels.INFO, {
      title = title,
      replace = notification,
      on_open = function(win)
        current_win = win
        height = vim.api.nvim_win_get_height(current_win)
      end,
    })

    if height then
      vim.api.nvim_win_set_height(current_win, height + length)
    end
    length = length + 1
  end

  local job = Job:new({
    command = command,
    args = args,
    on_stdout = vim.schedule_wrap(on_data),
    on_stderr = vim.schedule_wrap(on_data),
    on_exit = function(_, code, signal)
      if code ~= 0 or signal ~= 0 then
        vim.notify(output .. '\nExited with code: ' .. (signal == 0 and code or 128 + signal), vim.log.levels.ERROR, { title = title, replace = notification })
      end
    end,
  })

  job:start()
end

vim.keymap.set({ '', 't', 'i' }, '<A-g>', '<Cmd>vert Git<CR>))', { noremap = true, desc = 'Open Fugitive' })
vim.keymap.set('', '<Leader>gs', function() run_command('git', { 'status' }) end, { noremap = true, desc = 'Show git status' })
vim.keymap.set('', '<Leader>gP', function() run_command('git', { 'pull' }) end, { noremap = true, desc = 'Git pull' })
vim.keymap.set('', '<Leader>gp', function() run_command('git', { 'push' }) end, { noremap = true, desc = 'Git push' })
vim.keymap.set('', '<Leader>gfp', function() run_command('git', { 'push', '--force' }) end, { noremap = true, desc = 'Git push (force)' })
