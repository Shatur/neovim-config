require('noice').setup({
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  presets = {
    lsp_doc_border = true,
    long_message_to_split = true,
  },
  routes = {
    {
      filter = {
        event = 'msg_show',
        find = 'written',
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = 'msg_show',
        find = 'lines',
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = 'msg_show',
        find = 'ago',
      },
      opts = { skip = true },
    },
  },
})
