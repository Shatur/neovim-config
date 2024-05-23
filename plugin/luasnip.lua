local luasnip = require('luasnip')

for _, mode in ipairs({ 's', 'i' }) do
  vim.keymap.set(mode, '<C-f>', luasnip.expand_or_jump, { desc = 'Jump to next snippet' })
  vim.keymap.set(mode, '<C-b>', function() luasnip.jump(-1) end, { desc = 'Jump to previous snippet' })
end
