if vim.g.started_by_firenvim == true then
  return
end

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
  playground = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['ac'] = '@conditional.outer',
        ['ic'] = '@conditional.inner',
        ['al'] = '@loop.outer',
        ['il'] = '@loop.inner',
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ['<Leader><Right>'] = '@parameter.inner',
      },
      swap_previous = {
        ['<Leader><Left>'] = '@parameter.inner',
      }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']f'] = '@function.outer',
      },
      goto_next_end = {
        [']F'] = '@function.outer',
      },
      goto_previous_start = {
        ['[f'] = '@function.outer',
      },
      goto_previous_end = {
        ['[F'] = '@function.outer',
      },
    },
  }
}
