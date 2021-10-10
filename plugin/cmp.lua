local kinds = {
  Text = ' Text',
  Method = ' Method',
  Function = ' Function',
  Constructor = ' Constructor',
  Field = 'ﰠ Field',
  Variable = ' Variable',
  Class = 'ﴯ Class',
  Interface = ' Interface',
  Module = ' Module',
  Property = 'ﰠ Property',
  Unit = ' Unit',
  Value = ' Value',
  Enum = ' Enum',
  Keyword = ' Keyword',
  Snippet = '﬌ Snippet',
  Color = ' Color',
  File = ' File',
  Reference = ' Reference',
  Folder = ' Folder',
  EnumMember = ' Enum-member',
  Constant = ' Constant',
  Struct = 'פּ Struct',
  Event = ' Event',
  Operator = ' Operator',
  TypeParameter = ' Type-param',
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
      vim_item.kind = kinds[vim_item.kind]
      return vim_item
    end,
  },
})
