-- Like vim-gtfo but with much simpler implementation and never hangs Neovim
local Job = require('plenary.job')
local Path = require('plenary.path')

local function directory(path)
  if path == '' or path == nil then
    return vim.loop.cwd()
  end
  if not Path:new(path):is_dir() then
    print('Specified path is not an existing directory: ' .. path)
    return nil
  end
  return path
end

local function open_terminal(command)
  local path = directory(command and command.args)
  if path == nil then
    return
  end
  if vim.fn.has('unix') == 1 then
    local job = Job:new({
      command = 'konsole',
      args = { '--separate', '--workdir', path },
    })
    job:start()
  else
    local job = Job:new({
      command = 'wt',
      args = { '-d', path },
    })
    job:start()
  end
end

local function open_explorer(command)
  local path = directory(command and command.args)
  if path == nil then
    return
  end
  local job = Job:new({
    command = vim.fn.has('unix') == 1 and 'xdg-open' or 'explorer',
    args = { path },
  })
  job:start()
end

vim.api.nvim_create_user_command('Explorer', open_explorer, { nargs = '*', complete = 'dir', desc = 'Open directory in system explorer' })
vim.api.nvim_create_user_command('Terminal', open_terminal, { nargs = '*', complete = 'dir', desc = 'Open directory in system terminal' })

vim.keymap.set('', 'goF', open_explorer, { noremap = true, desc = 'Open current directory in system explorer' })
vim.keymap.set('', 'goT', open_terminal, { noremap = true, desc = 'Open current directory in system terminal' })

vim.keymap.set('', 'got', function() open_terminal({ args = vim.fn.expand('%:h') }) end, { noremap = true, desc = 'Open current file directory in system explorer' })
vim.keymap.set('', 'gof', function() open_explorer({ args = vim.fn.expand('%:h') }) end, { noremap = true, desc = 'Open current file directory in system terminal' })
