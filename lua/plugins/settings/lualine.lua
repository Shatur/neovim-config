local auto = require('lualine.themes.auto')
-- Fix weird bg color in automatically generated theme
auto.normal.c.bg = auto.normal.b.bg
auto.insert.c.bg = auto.insert.b.bg
auto.replace.c.bg = auto.replace.b.bg
auto.visual.c.bg = auto.visual.b.bg
auto.command.c.bg = auto.command.b.bg

require('lualine').setup{
  options = {
    theme = auto,
    section_separators = {},
    component_separators = {'|', '|'},
  },
}
