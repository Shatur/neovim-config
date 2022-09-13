local lualine = require('lualine')
local colors = require('ayu.colors')
local lsp_status = require('lsp-status')
local tasks_runner = require('tasks.runner')

-- Left sections
local mode = {
  'mode',
  fmt = function(mode) return '▊ ' .. mode end,
  color = function()
    local mode_colors = {
      n = colors.entity,
      i = colors.string,
      v = colors.accent,
      [''] = colors.accent,
      V = colors.accent,
      c = colors.markup,
      no = colors.entity,
      s = colors.keyword,
      S = colors.keyword,
      [''] = colors.keyword,
      ic = colors.special,
      R = colors.tag,
      Rv = colors.tag,
      cv = colors.error,
      ce = colors.error,
      r = colors.regexp,
      rm = colors.regexp,
      ['r?'] = colors.regexp,
      ['!'] = colors.constant,
      t = colors.constant,
    }
    local mode = vim.api.nvim_get_mode().mode
    return { fg = mode_colors[mode], bg = colors.panel_border, gui = 'bold' }
  end,
  padding = { left = 0, right = 1 },
}

local filetype = {
  'filetype',
  colored = true,
  icon_only = true,
  padding = { left = 1, right = 0 },
}

local filename = {
  'filename',
  color = { fg = colors.keyword, gui = 'bold' },
  symbols = {
    modified = '',
    readonly = '',
  },
}

local multiple_cursros = {
  function()
    local vm_info = vim.fn.VMInfos()
    if vim.tbl_isempty(vm_info) then
      return ''
    end
    return vm_info['current'] .. '/' .. vm_info['total']
  end,
  icon = '',
  color = { fg = colors.special, gui = 'bold' },
}

local diagnostics = {
  'diagnostics',
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.error },
    warning = { fg = colors.warning },
    info = { fg = colors.tag },
    hint = { fg = colors.regexp },
  },
}

local status = {
  function() return lsp_status.status() end,
  color = { fg = colors.func },
}

-- Right sections
local task = {
  function()
    local current_job_name = tasks_runner.get_current_job_name()
    if current_job_name then
      return 'Running ' .. current_job_name
    end
    return ''
  end,
  icon = '',
  color = { fg = colors.tag },
}

local gitsigns_head = {
  'b:gitsigns_head',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
}

local diff = {
  'diff',
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
    end
  end,
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.vcs_added },
    modified = { fg = colors.vcs_modified },
    removed = { fg = colors.vcs_removed },
  },
}

local encoding = {
  'o:encoding',
  fmt = string.upper,
  color = { fg = colors.string, gui = 'bold' },
}

local fileformat = {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.string, gui = 'bold' },
}

lualine.setup({
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = 'ayu',
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = { mode, filetype, filename, 'location', multiple_cursros, diagnostics, status },
    lualine_x = { task, gitsigns_head, diff, encoding, fileformat },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = { filetype, filename, 'location', multiple_cursros, diagnostics, status },
    lualine_x = { diff, encoding, fileformat },
  },
  extensions = { 'nvim-dap-ui', 'neo-tree', 'quickfix', 'fugitive' },
})
