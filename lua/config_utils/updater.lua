local updater = {}
local toggleterm = require('toggleterm')

function updater.update_plugins(path)
  path = path or 'pack'
  toggleterm.exec('git submodule update --remote --jobs=8 ' .. path .. ' && git add --update ' .. path .. ' && git commit -m "Update plugins"', 1, nil, vim.fn.stdpath('config'))
end

function updater.update_config()
  toggleterm.exec('git pull --recurse-submodules --jobs=8')
end

return updater
