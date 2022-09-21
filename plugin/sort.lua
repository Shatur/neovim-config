for _, value in ipairs({ '"', "'", '(', '[', 'p', '{' }) do
  vim.keymap.set('n', '<Leader>s' .. value, 'vi' .. value .. '<Esc><Cmd>Sort<CR>', { noremap = true, desc = 'Sort inside ' .. value })
end
