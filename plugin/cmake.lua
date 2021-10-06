local config = {
  configure_arguments = '-D CMAKE_EXPORT_COMPILE_COMMANDS=1 -G Ninja',
  dap_open_command = require('dapui').open,
}

if vim.fn.has('unix') == 1 then
  config.configure_arguments = config.configure_arguments .. ' -D CMAKE_CXX_FLAGS=-gdwarf-4'
else
  config.configure_arguments = config.configure_arguments .. ' -D CMAKE_TOOLCHAIN_FILE=C:/ProgramData/vcpkg/scripts/buildsystems/vcpkg.cmake -D VCPKG_TARGET_TRIPLET=x64-windows'
  config.asyncrun_options = { save = 2, program = 'vcvars64' }
end

require('cmake').setup(config)

vim.api.nvim_set_keymap('', '<F5>', '<Cmd>CMake build_and_debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F5>', '<Cmd>CMake build_and_debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-F5>', '<Cmd>CMake set_target_arguments<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F5>', '<Cmd>CMake set_target_arguments<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-F5>', '<Cmd>CMake debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F5>', '<Cmd>CMake debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F6>', '<Cmd>CMake build_and_run<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F6>', '<Cmd>CMake build_and_run<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-F6>', '<Cmd>CMake run<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F6>', '<Cmd>CMake run<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F7>', '<Cmd>CMake build<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F7>', '<Cmd>CMake build<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-F7>', '<Cmd>Telescope cmake select_target<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F7>', '<Cmd>Telescope cmake select_target<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-F7>', '<Cmd>CMake build_all<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F7>', '<Cmd>CMake build_all<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F8>', '<Cmd>CMake configure<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F8>', '<Cmd>CMake configure<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-F8>', '<Cmd>Telescope cmake select_build_type<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F8>', '<Cmd>Telescope cmake select_build_type<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-F8>', '<Cmd>CMake clear_cache<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F8>', '<Cmd>CMake clear_cache<CR>', { noremap = true })
