require('bufferline').setup({
  highlights = {
    buffer_selected = {
      gui = 'bold',
    },
    warning_selected = {
      gui = 'bold,underline',
    },
    error_selected = {
      gui = 'bold,underline',
    },
    duplicate_selected = {
      gui = 'NONE',
    },
    duplicate_visible = {
      gui = 'NONE',
    },
    duplicate = {
      gui = 'NONE',
    },
    pick_selected = {
      gui = 'bold',
    },
    pick_visible = {
      gui = 'bold',
    },
    pick = {
      gui = 'bold',
    },
  },
  options = {
    close_command = 'BDelete! %d',
    right_mouse_command = 'BDelete! %d',
    offsets = {
      { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' },
      { filetype = 'NeogitStatus', text = 'Git', text_align = 'center' },
    },
  },
})

vim.api.nvim_set_keymap('', ']b', '<Cmd>BufferLineCycleNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '[b', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true })

vim.api.nvim_set_keymap('', '<A-]>', '<Cmd>BufferLineMoveNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-[>', '<Cmd>BufferLineMovePrev<CR>', { noremap = true })

vim.api.nvim_set_keymap('', 'Q', '<Cmd>BufferLineCloseRight<CR><Cmd>BufferLineCloseLeft<CR>', { noremap = true })

vim.api.nvim_set_keymap('', '<A-1>', '<Cmd>lua require("bufferline").go_to_buffer(1)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-2>', '<Cmd>lua require("bufferline").go_to_buffer(2)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-3>', '<Cmd>lua require("bufferline").go_to_buffer(3)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-4>', '<Cmd>lua require("bufferline").go_to_buffer(4)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-5>', '<Cmd>lua require("bufferline").go_to_buffer(5)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-6>', '<Cmd>lua require("bufferline").go_to_buffer(6)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-7>', '<Cmd>lua require("bufferline").go_to_buffer(7)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-8>', '<Cmd>lua require("bufferline").go_to_buffer(8)<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-9>', '<Cmd>lua require("bufferline").go_to_buffer(9)<CR>', { noremap = true })

vim.api.nvim_set_keymap('', 'gb', '<Cmd>BufferLinePick<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'gB', '<Cmd>BufferLinePickClose<CR>', { noremap = true })
