vim.g.neo_tree_remove_legacy_commands = true

require('neo-tree').setup({
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
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    },
    icon = {
      folder_empty = '',
      default = '',
      highlight = 'Normal',
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
    },
    commands = {
      copy_file_name = function(state)
        local node = state.tree:get_node()
        vim.fn.setreg('+', node.name, 'c')
      end,
      copy_file_path = function(state)
        local node = state.tree:get_node()
        local relative_path = node.path:sub(#state.path + 2)
        vim.fn.setreg('+', relative_path, 'c')
      end,
    },
  },
  window = {
    mappings = {
      ['h'] = 'close_node',
      ['l'] = 'open',
      ['<F2>'] = 'rename',
      ['/'] = '',
      ['<Leader>Y'] = 'copy_file_name',
      ['<Leader>y'] = 'copy_file_path',
    },
  },
})

local neo_tree_command = require('neo-tree.command')
vim.keymap.set('', '<Leader>r', function() neo_tree_command.execute({ reveal = true }) end, { noremap = true, desc = 'Toggle file tree' })
