local zephyr_status = require('lualine.themes.auto')
local zephyr = require('zephyr')
zephyr_status.normal.b.bg = zephyr.base2
zephyr_status.insert.b.bg = zephyr.base2
zephyr_status.replace.b.bg = zephyr.base2
zephyr_status.visual.b.bg = zephyr.base2
zephyr_status.command.b.bg = zephyr.base2
zephyr_status.normal.c.bg = zephyr.bg2
zephyr_status.insert.c.bg = zephyr.bg2
zephyr_status.replace.c.bg = zephyr.bg2
zephyr_status.visual.c.bg = zephyr.bg2
zephyr_status.command.c.bg = zephyr.bg2

require('lualine').setup{
  options = {
    theme = zephyr_status,
    section_separators = {},
    component_separators = {'|', '|'},
  },
}
