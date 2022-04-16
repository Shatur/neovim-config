local neogen = require('neogen')
local luasnip = require('luasnip')

vim.keymap.set('i', '<C-f>', function()
  if neogen.jumpable() then
    neogen.jump_next()
  else
    luasnip.expand_or_jump()
  end
end, {})
vim.keymap.set('i', '<C-b>', function()
  luasnip.jump(-1)
end, {})
vim.keymap.set('s', '<C-b>', function()
  luasnip.jump(-1)
end, {})
vim.keymap.set('s', '<C-f>', luasnip.expand_or_jump, {})
