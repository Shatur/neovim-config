local luasnip = require('luasnip')
local cmp = require('cmp')

local item_kinds = {
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
  GitHub = ' GitHub',
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'cmp_git' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-Space>'] = function()
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        cmp.complete()
      end
    end,
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = entry.source.name == 'cmp_git' and item_kinds['GitHub'] or item_kinds[vim_item.kind]
      return vim_item
    end,
  },
  window = {
    documentation = {
      border = 'rounded',
    },
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

require('cmp_git').setup()
