-- Open folder in system explorer
vim.cmd('command! -complete=dir -nargs=* Explorer lua require("config.utils.gtfo").open_explorer(vim.fn.expand("<args>"))')

-- Open folder in system terminal
vim.cmd('command! -complete=dir -nargs=* Terminal lua require("config.utils.gtfo").open_terminal(vim.fn.expand("<args>"))')

-- Used to prevent opening new buffers in a small buffers
vim.cmd('command! SwitchToNormalBuffer lua require("config.utils.buffers").switch_to_normal_buffer()')

-- Delete buffer with saving the current layout (except special buffers)
vim.cmd('command! BDelete lua require("config.utils.buffers").close_current_buffer()')

-- Delete all buffers except the current one
vim.cmd('command! BDeleteOther lua require("config.utils.buffers").close_other_buffers()')

-- Update all plugins and commit changes
vim.cmd('command! -nargs=? UpdatePlugins lua require("config.utils.updater").update_plugins(<args>)')

-- Pull latest configuration changes from repo
vim.cmd('command! UpdateConfig lua require("config.utils.updater").update_config()')

-- Start debugging
vim.cmd('command! -complete=file -nargs=+  Gdb lua require("config.utils.debug").gdb(<f-args>)')

-- Buffers / tabs control
vim.api.nvim_set_keymap('', '<C-q>', '<Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<Esc><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<Esc><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-x>', '<Cmd>w<CR><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc><Cmd>w<CR><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'Q', '<Cmd>SwitchToNormalBuffer<CR><Cmd>BDeleteOther<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Backspace>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>buffer #<CR>', { noremap = true })

-- Open current file folder
vim.api.nvim_set_keymap('', 'got', '<Cmd>lua require("config.utils.gtfo").open_terminal(vim.fn.expand("%:h"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'goT', '<Cmd>lua require("config.utils.gtfo").open_terminal()<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'gof', '<Cmd>lua require("config.utils.gtfo").open_explorer(vim.fn.expand("%:h"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'goF', '<Cmd>lua require("config.utils.gtfo").open_explorer()<CR>', { noremap = true })

--- Custom group for all autocmd's in configuration
vim.cmd('augroup vimrc')
vim.cmd('autocmd!')
--- Highligh yanked text
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank()')
--- Highligh word under cursor
vim.cmd('autocmd CursorMoved,CursorMovedI * lua require("config.utils.cursor").highlight_current_word()')
vim.cmd('augroup END')

