local kinds = {
  Text = ' Text',
  Method = ' Method',
  Function = ' Function',
  Constructor = ' Constructor',
  Field = 'ﰠ Field',
  Variable = ' Variable',
  Class = ' Class',
  Interface = ' Interface',
  Module = ' Module',
  Property = ' Property',
  Unit = ' Unit',
  Value = ' Value',
  Enum = ' Enum',
  Keyword = ' Keyword',
  Snippet = '﬌ Snippet',
  Color = ' Color',
  File = ' File',
  Reference = ' Reference',
  Folder = ' Folder',
  EnumMember = ' EnumMember',
  Constant = ' Constant',
  Struct = ' Struct',
  Event = 'ﯓ Event',
  Operator = ' Operator',
  TypeParameter = ' TypeParameter',
}

local sources = {
  { name = 'buffer' },
}
if not vim.g.started_by_firenvim then
  table.insert(sources, { name = 'nvim_lsp' })
  table.insert(sources, { name = 'luasnip' })
end

local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
  sources = sources,
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
