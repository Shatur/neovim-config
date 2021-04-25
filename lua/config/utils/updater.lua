local updater = {}

function updater.update_plugins(path)
  path = path or 'pack'
  vim.fn['asyncrun#run']('', {mode = 'term', pos = 'thelp'}, 'git submodule update --remote --jobs=8 ' .. path .. ' && git add ' .. path .. ' && git commit -m "Update plugins"')
end

function updater.update_config()
  vim.fn['asyncrun#run']('', {mode = 'term', pos = 'thelp'}, 'git pull --recurse-submodules --jobs=8')
end

return updater
