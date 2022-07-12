local luasnip = require('luasnip')
local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local completion_types = {
  Text = { kind = '', menu = 'Text' },
  Method = { kind = '', menu = 'Method' },
  Function = { kind = '', menu = 'Function' },
  Constructor = { kind = '', menu = 'Constructor' },
  Field = { kind = '', menu = 'Field' },
  Variable = { kind = '', menu = 'Variable' },
  Class = { kind = 'ﴯ', menu = 'Class' },
  Interface = { kind = '', menu = 'Interface' },
  Module = { kind = '', menu = 'Module' },
  Property = { kind = '', menu = 'Property' },
  Unit = { kind = '', menu = 'Unit' },
  Value = { kind = '', menu = 'Value' },
  Enum = { kind = '', menu = 'Enum' },
  Keyword = { kind = '', menu = 'Keyword' },
  Snippet = { kind = '﬌', menu = 'Snippet' },
  Color = { kind = '', menu = 'Color' },
  File = { kind = '', menu = 'File' },
  Reference = { kind = '', menu = 'Reference' },
  Folder = { kind = '', menu = 'Folder' },
  EnumMember = { kind = '', menu = 'Enum-member' },
  Constant = { kind = '', menu = 'Constant' },
  Struct = { kind = 'פּ', menu = 'Struct' },
  Event = { kind = '', menu = 'Event' },
  Operator = { kind = '', menu = 'Operator' },
  TypeParameter = { kind = '', menu = 'Type-param' },
  GitHub = { kind = '', menu = 'GitHub' },
}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'crates' },
    { name = 'buffer' },
    { name = 'git' },
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
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local completion_type = completion_types[entry.source.name == 'cmp_git' and 'GitHub' or vim_item.kind]
      vim_item.kind = completion_type.kind
      vim_item.menu = completion_type.menu
      return vim_item
    end,
  },
  window = {
    documentation = cmp.config.window.bordered(),
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

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      rust = false,
    },
  })
)

require('cmp_git').setup()
