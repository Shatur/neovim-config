local kinds = {
  Text = " Text",
  Method = " Method",
  Fun = " Fun",
  Constructor = " Constructor",
  Field = "ﰠ Field",
  Var = " Var",
  Class = "ﴯ Class",
  Interface = " Interface",
  Module = " Module",
  Property = "ﰠ Property",
  Unit = ' Unit',
  Value = " Value",
  Enum = " Enum",
  Keyword = " Keyword",
  Snippet = "﬌ Snippet",
  Color = " Color",
  File = " File",
  Reference = " Reference",
  Folder = " Folder",
  EnumMember = " Enum-member",
  Constant = " Constant",
  Struct = "פּ Struct",
  Event = " Event",
  Operator = " Operator",
  TypeParameter = ' Type-param',
}

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.close(),
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
