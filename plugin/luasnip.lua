local neogen = require('neogen')
local luasnip = require('luasnip')

local function expand_or_jump()
  if neogen.jumpable() then
    neogen.jump_next()
  else
    luasnip.expand_or_jump()
  end
end

for _, mode in ipairs({'s', 'i'}) do
  vim.keymap.set(mode, '<C-f>', expand_or_jump, { desc = 'Jump to next snippet' })
  vim.keymap.set(mode, '<C-b>', function() luasnip.jump(-1) end, { desc = 'Jump to previous snippet' })
end
