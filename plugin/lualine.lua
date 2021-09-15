local lualine = require('lualine')
local colors = require('ayu.colors')
local theme_utils = require('ayu.utils')

local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = 'ayu',
  },
  sections = {
    -- Remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- Will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- Remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    -- Will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  extensions = { 'nvim-tree', 'quickfix' },
}

-- Display only buffer names for these file types
table.insert(config.extensions, {
  sections = {
    lualine_a = { 'filename' },
    lualine_b = {
      function()
        return ' '
      end,
    },
  },
  filetypes = { 'NeogitStatus', 'dapui_watches', 'dapui_stacks', 'dapui_breakpoints', 'dapui_scopes' },
})

-- Left sections
table.insert(config.sections.lualine_c, {
  function()
    return '▊'
  end,
  color = { fg = colors.tag },
  padding = { left = 0, right = 1 }, -- We don't need space before this
})

table.insert(config.sections.lualine_c, {
  -- Mode component
  function()
    local modes = {
      n = { color = colors.entity, name = 'NORMAL' },
      i = { color = colors.string, name = 'INSERT' },
      v = { color = colors.accent, name = 'VISUAL' },
      [''] = { color = colors.accent, name = 'VISUAL BLOCK' },
      V = { color = colors.accent, name = 'VISUAL LINE' },
      c = { color = colors.markup, name = 'COMMAND' },
      no = { color = colors.entity, name = 'NORMAL' },
      s = { color = colors.keyword, name = 'SELECT' },
      S = { color = colors.keyword, name = 'SELECT LINE' },
      [''] = { color = colors.keyword, name = 'SELECT BLOCK' },
      ic = { color = colors.special, name = 'COMPLETION' },
      R = { color = colors.tag, name = 'REPLACE' },
      Rv = { color = colors.tag, name = 'REPLACE' },
      cv = { color = colors.error, name = 'EX' },
      ce = { color = colors.error, name = 'NORMAL EX' },
      r = { color = colors.regexp, name = 'PROMPT' },
      rm = { color = colors.regexp, name = 'PROMPT' },
      ['r?'] = { color = colors.regexp, name = 'CONFIRM' },
      ['!'] = { color = colors.constant, name = 'SHELL' },
      t = { color = colors.constant, name = 'TERMINAL' },
    }

    local mode = modes[vim.api.nvim_get_mode().mode]
    theme_utils.highlight('LualineMode', { fg = mode.color, bg = colors.panel_border, style = 'bold' })
    return mode.name
  end,
  color = 'LualineMode',
  padding = { left = 0 },
})

table.insert(config.sections.lualine_c, {
  'filetype',
  colored = true,
  icon_only = true,
})

table.insert(config.sections.lualine_c, {
  'filename',
  color = { fg = colors.keyword, gui = 'bold' },
})

table.insert(config.sections.lualine_c, {
  'location',
})

table.insert(config.sections.lualine_c, {
  'progress',
  color = { fg = colors.fg, gui = 'bold' },
})

table.insert(config.sections.lualine_c, {
  function()
    local vm_info = vim.fn.VMInfos()
    if vim.tbl_isempty(vm_info) then
      return ''
    end
    return vm_info['current'] .. '/' .. vm_info['total']
  end,
  icon = '',
  color = { fg = colors.special, gui = 'bold' },
})

table.insert(config.sections.lualine_c, {
  'diagnostics',
  sources = { 'nvim_lsp' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    error = { fg = colors.error },
    warning = { fg = colors.warning },
    info = { fg = colors.tag },
    hint = { fg = colors.regexp },
  },
})

-- Right sections
table.insert(config.sections.lualine_x, {
  function()
    if vim.g.asyncrun_status == 'running' then
      return 'Running'
    end
    return ''
  end,
  icon = '',
  color = { fg = colors.tag },
})

table.insert(config.sections.lualine_x, {
  function()
    return require('lsp-status').status():gsub('%%%%', '%%')
  end,
  color = { fg = colors.func },
})

table.insert(config.sections.lualine_x, {
  require('dap').status,
  color = { fg = colors.regexp },
})

table.insert(config.sections.lualine_x, {
  'b:gitsigns_head',
  icon = '',
  color = { fg = colors.fg, gui = 'bold' },
})

table.insert(config.sections.lualine_x, {
  'diff',
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
    end
  end,
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.vcs_added },
    modified = { fg = colors.vcs_modified },
    removed = { fg = colors.vcs_removed },
  },
})

table.insert(config.sections.lualine_x, {
  'o:encoding',
  fmt = string.upper,
  color = { fg = colors.string, gui = 'bold' },
})

table.insert(config.sections.lualine_x, {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false,
  color = { fg = colors.string, gui = 'bold' },
})

vim.list_extend(config.inactive_sections.lualine_c, config.sections.lualine_c, 3, #config.sections.lualine_c)
vim.list_extend(config.inactive_sections.lualine_x, config.sections.lualine_x, 4, #config.sections.lualine_x)

lualine.setup(config)
