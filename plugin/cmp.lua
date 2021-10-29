local items = {
  Text = { icon = '', name = 'Text' },
  Method = { icon = '', name = 'Method' },
  Function = { icon = '', name = 'Function' },
  Constructor = { icon = '', name = 'Constructor' },
  Field = { icon = 'ﰠ', name = 'Field' },
  Variable = { icon = '', name = 'Variable' },
  Class = { icon = 'ﴯ', name = 'Class' },
  Interface = { icon = '', name = 'Interface' },
  Module = { icon = '', name = 'Module' },
  Property = { icon = 'ﰠ', name = 'Property' },
  Unit = { icon = '', name = 'Unit' },
  Value = { icon = '', name = 'Value' },
  Enum = { icon = '', name = 'Enum' },
  Keyword = { icon = '', name = 'Keyword' },
  Snippet = { icon = '﬌', name = 'Snippet' },
  Color = { icon = '', name = 'Color' },
  File = { icon = '', name = 'File' },
  Reference = { icon = '', name = 'Reference' },
  Folder = { icon = '', name = 'Folder' },
  EnumMember = { icon = '', name = 'Enum-member' },
  Constant = { icon = '', name = 'Constant' },
  Struct = { icon = 'פּ', name = 'Struct' },
  Event = { icon = '', name = 'Event' },
  Operator = { icon = '', name = 'Operator' },
  TypeParameter = { icon = '', name = 'Type-param' },
}

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = function()
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        cmp.complete()
      end
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      local item = items[vim_item.kind]
      vim_item.kind = item.icon
      vim_item.menu = item.name
      return vim_item
    end,
  },
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
