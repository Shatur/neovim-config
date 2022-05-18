vim.g.neo_tree_remove_legacy_commands = true

local config = {
  enable_diagnostics = false,
  enable_git_status = false,
  enable_modified_markers = false,
  enable_refresh_on_write = false,
  use_popups_for_input = false,
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      padding = 0,
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    },
    icon = {
      folder_empty = '',
      default = '',
      highlight = 'Normal',
    },
  },
  window = {
    mappings = {
      ['h'] = 'close_node',
      ['l'] = 'open',
      ['/'] = '',
      ['Y'] = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg('+', node.name, 'c')
      end,
      ['<C-y>'] = function(state)
        local node = state.tree:get_node()
        local relative_path = node.path:sub(#state.path + 2)
        vim.fn.setreg('+', relative_path, 'c')
      end,
    },
  },
}

require('neo-tree').setup(config)

local neo_tree_command = require('neo-tree.command')
vim.keymap.set('', '<A-f>', function()
  neo_tree_command.execute({ reveal = true })
end, { noremap = true })
