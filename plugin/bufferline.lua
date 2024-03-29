local bufferline = require('bufferline')

bufferline.setup({
  highlights = {
    fill = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLineFill',
      },
    },
    background = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    tab = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    tab_selected = {
      fg = {
        attribute = 'fg',
        highlight = 'Normal',
      },
      italic = false,
    },
    separator_selected = {
      fg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      bg = {
        attribute = 'bg',
        highlight = 'Normal',
      },
    },
    separator = {
      fg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    close_button = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    buffer_selected = {
      italic = false,
    },
    pick_selected = {
      italic = false,
    },
    pick_visible = {
      italic = false,
    },
    pick = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      italic = false,
    },
    modified = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    duplicate = {
      bg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      italic = false,
    },
    duplicate_selected = {
      italic = false,
    },
  },
  options = {
    close_command = 'BDelete! %d',
    right_mouse_command = 'BDelete! %d',
    offsets = {
      { filetype = 'neo-tree', text = 'File Explorer', text_align = 'center' },
    },
  },
})

vim.keymap.set('', ']b', function() bufferline.cycle(1) end, { noremap = true, desc = 'Go to next buffer' })
vim.keymap.set('', '[b', function() bufferline.cycle(-1) end, { noremap = true, desc = 'Go to previous buffer' })

vim.keymap.set('', ']]', function() bufferline.move(1) end, { noremap = true, desc = 'Move current buffer right' })
vim.keymap.set('', '[[', function() bufferline.move(-1) end, { noremap = true, desc = 'Move current buffer left' })

for i = 1, 9 do
  vim.keymap.set('', string.format('<A-%d>', i), function() bufferline.go_to_buffer(i) end, { noremap = true, desc = 'Go to buffer ' .. i })
end

vim.keymap.set('', '<Leader><Tab>', bufferline.pick_buffer, { noremap = true, desc = 'Pick buffer to jump' })
vim.keymap.set('', '<Leader><S-Tab>', bufferline.close_with_pick, { noremap = true, desc = 'Pick buffer to close' })
