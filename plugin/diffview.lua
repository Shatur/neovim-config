if vim.g.started_by_firenvim == true then
  return
end

local callback = require('diffview.config').diffview_callback

require('diffview').setup {
  key_bindings = {
    view = {
      -- Defaults
      ['<Tab>'] = callback('select_next_entry'),
      ['<S-tab>'] = callback('select_prev_entry'),
      -- Custom
      ['<A-f>'] = callback('focus_files'),
      ['<C-q>'] = callback('toggle_files')
    },
    file_panel = {
      -- Defaults
      ['j'] = callback('next_entry'),
      ['<Down>'] = callback('next_entry'),
      ['k'] = callback('prev_entry'),
      ['<Up>'] = callback('prev_entry'),
      ['o'] = callback('select_entry'),
      ['R'] = callback('refresh_files'),
      ['<Tab>'] = callback('select_next_entry'),
      ['<T-Tab>'] = callback('select_prev_entry'),
      -- Custom
      ['<A-f>'] = callback('focus_files'),
      ['<C-q>'] = callback('toggle_files'),
      ['<2-LeftMouse>'] = callback('select_entry'),
      ['<C-CR>'] = callback('select_entry')
    }
  }
}

vim.api.nvim_set_keymap('', '<A-v>', '<Cmd>DiffviewOpen<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-v>', '<Cmd>DiffviewOpen<CR>', { noremap = true })
