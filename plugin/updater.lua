local toggleterm = require('toggleterm')

vim.api.nvim_create_user_command('UpdatePlugins', function(command)
  local path = command.args or 'pack'
  toggleterm.exec('git submodule update --remote --jobs=8 ' .. path .. ' && git add --update ' .. path .. ' && git commit -m "Update plugins"', 1, nil, vim.fn.stdpath('config'))
end, { nargs = '?', complete = 'dir', desc = 'Update all plugins and commit the changes' })

vim.api.nvim_create_user_command(
  'UpdateConfig',
  function() toggleterm.exec('git pull --recurse-submodules --jobs=8', 1, nil, vim.fn.stdpath('config')) end,
  { desc = 'Pull latest configuration changes from repo' }
)

vim.api.nvim_create_user_command(
  'UpdateTelescopeFzf',
  function()
    toggleterm.exec(
      'cmake -S . -B build -D CMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      1,
      nil,
      vim.fn.stdpath('config') .. '/pack/plugins/start/telescope-fzf-native.nvim'
    )
  end,
  { desc = 'Update FZF sorter for telescope' }
)
