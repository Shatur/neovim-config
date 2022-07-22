for _, value in ipairs({ '"', "'", '(', '[', 'p', '{' }) do
  vim.keymap.set('n', 'gs' .. value, 'vi' .. value .. '<Esc><Cmd>Sort<CR>', { noremap = true })
end
