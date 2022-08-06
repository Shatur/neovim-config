for _, value in ipairs({ '"', "'", '(', '[', 'p', '{' }) do
  vim.keymap.set('n', 'si' .. value, 'vi' .. value .. '<Esc><Cmd>Sort<CR>', { noremap = true })
end
