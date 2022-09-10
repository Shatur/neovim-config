local tasks = require('tasks')
local dapui = require('dapui')

local configure_args = require('tasks.config').default_params.cmake.args.configure
if vim.fn.has('unix') == 1 then
  table.insert(configure_args, '-D')
  table.insert(configure_args, 'CMAKE_CXX_FLAGS=-gdwarf-4')
else
  table.insert(configure_args, '-D')
  table.insert(configure_args, 'CMAKE_TOOLCHAIN_FILE=C:/ProgramData/vcpkg/scripts/buildsystems/vcpkg.cmake')
  table.insert(configure_args, '-D')
  table.insert(configure_args, 'VCPKG_TARGET_TRIPLET=x64-windows')
  table.insert(configure_args, '-D')
  table.insert(configure_args, 'VCPKG_INSTALL_OPTIONS=--clean-after-build')
end

tasks.setup({
  cmake = {
    args = {
      configure = configure_args,
    },
  },
  dap_open_command = dapui.open,
})

vim.keymap.set({ '', 'i' }, '<C-BS>', function()
  tasks.cancel()
  dapui.close()
end, { noremap = true })

local key_index = 5
for _, task_name in ipairs({ 'debug', 'run', 'test', 'build' }) do
  vim.keymap.set({ '', 'i' }, string.format('<F%d>', key_index), function() tasks.start('auto', task_name) end, { noremap = true })
  vim.keymap.set({ '', 'i' }, string.format('<S-F%d>', key_index), function() tasks.set_task_param('auto', task_name, 'args') end, { noremap = true })
  vim.keymap.set({ '', 'i' }, string.format('<A-F%d>', key_index), function() tasks.set_task_param('auto', task_name, 'env') end, { noremap = true })
  key_index = key_index + 1
end

vim.keymap.set({ '', 'i' }, '<C-F6>', function() tasks.set_module_param('auto', 'target') end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<C-F8>', function() tasks.set_module_param('auto', 'build') end, { noremap = true })

vim.keymap.set({ '', 'i' }, '<F9>', function() tasks.start('auto', 'configure') end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-F9>', function() tasks.start('auto', 'clippy') end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-F9>', function() tasks.start('auto', 'clean') end, { noremap = true })
