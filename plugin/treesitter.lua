require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'comment',
    'cpp',
    'dockerfile',
    'html',
    'json',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'python',
    'regex',
    'ron',
    'rust',
    'toml',
    'vim',
    'yaml',
  },
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  nt_cpp_tools = {
    enable = true,
    preview = {
      quit = '<C-c>', -- optional keymapping for quit preview
      accept = '<C-f>', -- optional keymapping for accept preview
    },
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
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<Leader><Right>'] = '@parameter.inner',
      },
      swap_previous = {
        ['<Leader><Left>'] = '@parameter.inner',
      },
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
  },
})

require('treesitter-context').setup({
  multiline_threshold = 1,
})
