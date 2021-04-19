vim.g.cmake_configure_arguments = '-G Ninja'
if vim.fn.has('win32') == 1 then
  vim.g.cmake_configure_arguments = vim.g.cmake_configure_arguments .. ' -D CMAKE_TOOLCHAIN_FILE=C:/ProgramData/vcpkg/scripts/buildsystems/vcpkg.cmake -D VCPKG_TARGET_TRIPLET=x64-windows'
end

vim.api.nvim_set_keymap('n', '<F5>', '<Cmd>CMake build_and_debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F5>', '<Cmd>CMake build_and_debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-F5>', '<Cmd>CMake set_target_arguments<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F5>', '<Cmd>CMake set_target_arguments<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-F5>', '<Cmd>CMake debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F5>', '<Cmd>CMake debug<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', '<Cmd>CMake build_and_run<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F6>', '<Cmd>CMake build_and_run<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-F6>', '<Cmd>CMake run<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F6>', '<Cmd>CMake run<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-F6>', '<Cmd>Telescope cmake select_target theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F6>', '<Cmd>Telescope cmake select_target theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F7>', '<Cmd>CMake build<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F7>', '<Cmd>CMake build<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-F7>', '<Cmd>Telescope cmake select_build_type theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-F7>', '<Cmd>Telescope cmake select_build_type theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-F7>', '<Cmd>CMake build_all<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F7>', '<Cmd>CMake build_all<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', '<Cmd>CMake configure<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F8>', '<Cmd>CMake configure<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-F8>', '<Cmd>CMake clean<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-F8>', '<Cmd>CMake clean<CR>', { noremap = true })
