-- Like vim-gtfo plugin but with much simpler implementation and never hangs Neovim
local gtfo = {}

local function directory(path)
  if path == '' or path == nil then
    return vim.fn.getcwd()
  end
  if vim.fn.isdirectory(path) == 0 then
    print('Specified path is not an existing directory: ' .. path)
    return nil
  end
  return path
end

function gtfo.open_terminal(path)
  path = directory(path)
  if path == nil then
    return
  end
  if vim.fn.has('unix') == 1 then
    vim.fn.system('konsole --separate --workdir ' .. vim.fn.shellescape(path) .. ' &')
  else
    vim.fn.system('wt -d ' .. vim.fn.shellescape(path))
  end
end

function gtfo.open_explorer(path)
  path = directory(path)
  if path == nil then
    return
  end
  if vim.fn.has('unix') == 1 then
    vim.fn.system('xdg-open ' .. vim.fn.shellescape(path))
  else
    vim.fn.system('explorer ' .. vim.fn.shellescape(path))
  end
end

return gtfo
