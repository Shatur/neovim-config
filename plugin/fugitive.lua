local function run_command(command)
  local notification
  local title = 'Running ' .. table.concat(command, ' ')

  local output = ''
  local on_data = function(_, data)
    output = output .. table.concat(data, '\n')
    notification = vim.notify(output, vim.log.levels.INFO, { title = title, replace = notification })
  end

  vim.fn.jobstart(command, {
    on_stdout = on_data,
    on_stderr = on_data,
    on_exit = function(_, code)
      if code ~= 0 then
        vim.notify(output .. '\nExited with code: ' .. code, vim.log.levels.ERROR, { title = title, replace = notification })
      end
    end,
  })
end

vim.keymap.set({ '', 't', 'i' }, '<A-g>', '<Cmd>vert Git<CR>', { noremap = true })
vim.keymap.set('', '<Leader>gP', function()
  run_command({ 'git', 'pull' })
end, { noremap = true })
vim.keymap.set('', '<Leader>gp', function()
  run_command({ 'git', 'push' })
end, { noremap = true })
vim.keymap.set('', '<Leader>gfp', function()
  run_command({ 'git', 'push', '--force' })
end, { noremap = true })
