local bufferline = require('bufferline')

bufferline.setup({
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
      { filetype = 'fugitive', text = 'Git', text_align = 'center' },
    },
  },
})

vim.keymap.set('', ']b', function()
  bufferline.cycle(1)
end, { noremap = true })
vim.keymap.set('', '[b', function()
  bufferline.cycle(-1)
end, { noremap = true })

vim.keymap.set('', '<A-]>', function()
  bufferline.move(1)
end, { noremap = true })
vim.keymap.set('', '<A-[>', function()
  bufferline.move(-1)
end, { noremap = true })

vim.keymap.set('', 'Q', function()
  bufferline.close_in_direction('left')
  bufferline.close_in_direction('right')
end, { noremap = true })

for i = 1, 9 do
  vim.keymap.set('', string.format('<A-%d>', i), function()
    bufferline.go_to_buffer(i)
  end, { noremap = true })
end

vim.keymap.set('', '<Leader><Tab>', bufferline.pick_buffer, { noremap = true })
vim.keymap.set('', '<Leader><S-Tab>', bufferline.close_with_pick, { noremap = true })
