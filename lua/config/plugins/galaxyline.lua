local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local theme_utils = require('ayu.utils')
local colors = require('ayu.colors')
local gls = gl.section

gl.short_line_list = {
  'NvimTree',
  'NeogitStatus',
  'spectre_panel',
  'qf',
}

local modes = {
  n = {color = colors.entity, name = 'NORMAL'},
  i = {color = colors.string, name = 'INSERT'},
  v = {color = colors.accent, name = 'VISUAL'},
  [''] = {color = colors.accent, name = 'VISUAL BLOCK'},
  V = {color = colors.accent, name = 'VISUAL LINE'},
  c = {color = colors.markup, name = 'COMMAND'},
  no = {color = colors.entity, name = 'NORMAL'},
  s = {color = colors.keyword, name = 'SELECT'},
  S = {color = colors.keyword, name = 'SELECT LINE'},
  [''] = {color = colors.keyword, name = 'SELECT BLOCK'},
  ic = {color = colors.special, name = 'COMPLETION'},
  R = {color = colors.tag, name = 'REPLACE'},
  Rv = {color = colors.tag, name = 'REPLACE'},
  cv = {color = colors.error, name = 'EX'},
  ce = {color = colors.error, name = 'NORMAL EX'},
  r = {color = colors.regexp, name = 'PROMPT'},
  rm = {color = colors.regexp, name = 'PROMPT'},
  ['r?'] = {color = colors.regexp, name = 'CONFIRM'},
  ['!'] = {color = colors.constant, name = 'SHELL'},
  t = {color = colors.constant, name = 'TERMINAL'}
}

table.insert(gls.left, {
  Begin = {
    provider = function() return '▊ ' end,
    highlight = {colors.tag, colors.panel_border}
  }
})

table.insert(gls.left, {
  ViMode = {
    provider = function()
      local mode = modes[vim.fn.mode()]
      theme_utils.highlight('GalaxyViMode', {fg = mode.color, bg = colors.panel_border, style = 'bold'})
      return mode.name .. ' '
    end
  }
})

table.insert(gls.left, {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.panel_border}
  }
})

table.insert(gls.left,{
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color, colors.panel_border},
  },
})

table.insert(gls.left, {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.keyword, colors.panel_border, 'bold'}
  }
})

table.insert(gls.left, {
  LineInfo = {
    provider = 'LineColumn',
    highlight = {colors.fg, colors.panel_border},
  },
})

table.insert(gls.left, {
  Percent = {
    provider = 'LinePercent',
    highlight = {colors.fg, colors.panel_border, 'bold'},
  }
})

table.insert(gls.left, {
  Cursors = {
    provider = function()
      local vm_info = vim.fn.VMInfos()
      if vim.tbl_isempty(vm_info) then
        return ''
      end
      return vm_info['current'] .. '/' .. vm_info['total'] .. ' '
    end,
    highlight = {colors.special, colors.panel_border, 'bold'},
  }
})

table.insert(gls.left, {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.error, colors.panel_border}
  }
})

table.insert(gls.left, {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.keyword, colors.panel_border},
  }
})

table.insert(gls.left, {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.tag, colors.panel_border},
  }
})

table.insert(gls.left, {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.tag, colors.panel_border},
  }
})

table.insert(gls.right, {
  Asynctasks = {
    provider = function()
      if vim.g.asyncrun_status == 'running' then
        return 'Running'
      end
      return ''
    end,
    icon = '  ',
    highlight = {colors.tag, colors.panel_border},
  }
})

table.insert(gls.right, {
  LspStatus = {
    provider = require('lsp-status').status,
    condition = condition.hide_in_width,
    highlight = {colors.func, colors.panel_border}
  }
})

table.insert(gls.right, {
  DapSession = {
    provider = require('dap').status,
    highlight = {colors.regexp, colors.panel_border}
  }
})

table.insert(gls.right, {
  GitBranch = {
    provider = 'GitBranch',
    icon = ' ',
    separator = ' ',
    separator_highlight = {'NONE', colors.panel_border},
    condition = condition.check_git_workspace,
    highlight = {colors.fg, colors.panel_border, 'bold'},
  }
})

table.insert(gls.right, {
  DiffAdd = {
    provider = 'DiffAdd',
    separator = ' ',
    separator_highlight = {'NONE', colors.panel_border},
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.vcs_added, colors.panel_border},
  }
})

table.insert(gls.right, {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.vcs_modified, colors.panel_border},
  }
})

table.insert(gls.right, {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.vcs_removed, colors.panel_border},
  }
})

table.insert(gls.right, {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    highlight = {colors.string, colors.panel_border, 'bold'}
  }
})

table.insert(gls.right, {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.panel_border},
    highlight = {colors.string, colors.panel_border, 'bold'}
  }
})

table.insert(gls.right, {
  End = {
    provider = function() return ' ' end,
    highlight = {colors.tag, colors.panel_border}
  }
})

table.insert(gls.short_line_left, gls.left[1])

table.insert(gls.short_line_left, {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE', colors.panel_border},
    highlight = {colors.keyword, colors.panel_border, 'bold'}
  }
})

table.insert(gls.short_line_left, {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.panel_border, 'bold'}
  }
})

table.insert(gls.short_line_right, {
  BufferIcon = {
    provider = 'BufferIcon',
    highlight = {colors.fg, colors.panel_border}
  }
})
