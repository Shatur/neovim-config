require('lualine').setup{
  options = {
    theme = 'ayu',
    section_separators = {},
    component_separators = {'|', '|'},
  },
  sections = {
    lualine_a = {require('config.utils.statusline').mode},
    lualine_c = {{'filename', symbols = {modified = ' ', readonly = ' '}}, {'diagnostics', sources = {'nvim_lsp'}}},
    lualine_x = {require('dap').status, require('lsp-status').status, require('config.utils.statusline').cursors, 'encoding', 'fileformat', 'filetype'}
  }
}
