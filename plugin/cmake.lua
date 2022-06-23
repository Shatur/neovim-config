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
