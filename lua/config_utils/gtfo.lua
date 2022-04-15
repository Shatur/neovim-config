-- Like vim-gtfo plugin but with much simpler implementation and never hangs Neovim
local Job = require('plenary.job')
local Path = require('plenary.path')
local gtfo = {}

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

function gtfo.open_terminal(command)
  local path = directory(command.args)
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

function gtfo.open_explorer(command)
  local path = directory(command.args)
  if path == nil then
    return
  end
  local job = Job:new({
    command = vim.fn.has('unix') == 1 and 'xdg-open' or 'explorer',
    args = { path },
  })
  job:start()
end

return gtfo
