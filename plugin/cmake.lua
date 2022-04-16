local cmake = require('cmake')

local config = {
  configure_args = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-G', 'Ninja' },
  dap_open_command = require('dapui').open,
}

if vim.fn.has('unix') == 1 then
  table.insert(config.configure_args, '-D')
  table.insert(config.configure_args, 'CMAKE_CXX_FLAGS=-gdwarf-4')
else
  table.insert(config.configure_args, '-D')
  table.insert(config.configure_args, 'CMAKE_TOOLCHAIN_FILE=C:/ProgramData/vcpkg/scripts/buildsystems/vcpkg.cmake')
  table.insert(config.configure_args, '-D')
  table.insert(config.configure_args, 'VCPKG_TARGET_TRIPLET=x64-windows')
  table.insert(config.configure_args, '-D')
  table.insert(config.configure_args, 'VCPKG_INSTALL_OPTIONS=--clean-after-build')
end
cmake.setup(config)

local function save_all()
  for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
    if #vim.api.nvim_buf_get_name(buffer) ~= 0 and vim.api.nvim_buf_get_option(buffer, 'modified') then
      vim.api.nvim_command('silent write')
    end
  end
end

vim.keymap.set({ '', 'i' }, '<C-BS>', cmake.cancel, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F5>', function()
  save_all()
  cmake.build_and_debug()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-F5>', cmake.set_target_args, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-F5>', cmake.debug, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F6>', function()
  save_all()
  cmake.build_and_run()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-F6>', cmake.run, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F7>', function()
  save_all()
  cmake.build()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-F7>', cmake.select_target, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-F7>', function()
  save_all()
  cmake.build_all()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F8>', function()
  save_all()
  cmake.configure()
end, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-F8>', cmake.select_build_type, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-F8>', cmake.clear_cache, { noremap = true })
