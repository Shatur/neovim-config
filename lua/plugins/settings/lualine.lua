local zephyr_status = require('lualine.themes.auto')
local zephyr = require('zephyr')
zephyr_status.normal.c.bg = zephyr.base2
zephyr_status.insert.c.bg = zephyr.base2
zephyr_status.replace.c.bg = zephyr.base2
zephyr_status.visual.c.bg = zephyr.base2
zephyr_status.command.c.bg = zephyr.base2

require('lualine').setup{
  options = {
    theme = zephyr_status,
    section_separators = {},
    component_separators = {'|', '|'},
  },
  sections = {
    lualine_a = {require('utils.statusline').mode},
    lualine_c = {'filename', {'diagnostics', sources = {'nvim_lsp'}, color_error = zephyr.red, color_warn = zephyr.orange, color_info = zephyr.fg}},
    lualine_x = {require('dap').status, require('lsp-status').status, require('utils.statusline').cursors, 'encoding', 'fileformat', 'filetype'}
  }
}
