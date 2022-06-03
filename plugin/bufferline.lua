local bufferline = require('bufferline')

bufferline.setup({
  highlights = {
    fill = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLineFill',
      },
    },
    background = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    tab = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    tab_selected = {
      guifg = {
        attribute = 'fg',
        highlight = 'Normal',
      },
      gui = 'bold',
    },
    separator_selected = {
      guifg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      guibg = {
        attribute = 'bg',
        highlight = 'Normal',
      },
    },
    separator = {
      guifg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    close_button = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    buffer_selected = {
      gui = 'bold',
    },
    pick_selected = {
      gui = 'bold',
    },
    pick_visible = {
      gui = 'bold',
    },
    pick = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      gui = 'bold',
    },
    modified = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
    },
    duplicate = {
      guibg = {
        attribute = 'bg',
        highlight = 'TabLine',
      },
      gui = false,
    },
    duplicate_selected = {
      gui = false,
    },
  },
  options = {
    close_command = 'BDelete! %d',
    right_mouse_command = 'BDelete! %d',
    offsets = {
      { filetype = 'neo-tree', text = 'File Explorer', text_align = 'center' },
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

for i = 1, 9 do
  vim.keymap.set('', string.format('<A-%d>', i), function()
    bufferline.go_to_buffer(i)
  end, { noremap = true })
end

vim.keymap.set('', '<Leader><Tab>', bufferline.pick_buffer, { noremap = true })
vim.keymap.set('', '<Leader><S-Tab>', bufferline.close_with_pick, { noremap = true })
