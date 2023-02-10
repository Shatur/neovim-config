local telescope = require('telescope')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local telescope_builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    mappings = {
      i = {
        ['<C-j>'] = actions.cycle_history_next,
        ['<C-k>'] = actions.cycle_history_prev,
        ['<C-v>'] = false,
        ['<C-s>'] = actions.select_vertical,
        ['<C-q>'] = actions.close,
        ['<C-CR>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      n = {
        ['<C-q>'] = actions.close,
      },
    },
  },
  pickers = {
    spell_suggest = {
      theme = 'cursor',
    },
    lsp_code_actions = {
      theme = 'cursor',
    },
    lsp_range_code_actions = {
      theme = 'cursor',
    },
    buffers = {
      theme = 'dropdown',
    },
    oldfiles = {
      theme = 'dropdown',
    },
    find_files = {
      theme = 'dropdown',
      hidden = true,
    },
    git_files = {
      theme = 'dropdown',
    },
    git_branches = {
      theme = 'dropdown',
      pattern = '--sort=-committerdate',
    },
    git_commits = {
      theme = 'ivy',
      mappings = {
        i = {
          ['<C-o>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = action_state.get_selected_entry().value
            vim.api.nvim_command('vertical G show -p ' .. value)
          end,
          ['<C-s>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = action_state.get_selected_entry().value
            vim.api.nvim_command('G difftool -y ' .. value .. '~1..' .. value)
          end,
        },
      },
    },
    git_stash = {
      theme = 'ivy',
      mappings = {
        i = {
          ['<C-o>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = action_state.get_selected_entry().value
            vim.api.nvim_command('vertical G stash show -p ' .. value)
          end,
          ['<C-x>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = action_state.get_selected_entry().value
            vim.api.nvim_command('G stash pop ' .. value)
          end,
        },
      },
    },
    help_tags = {
      theme = 'ivy',
    },
  },
  extensions = {
    live_grep_args = {
      mappings = {
        i = {
          ["<C-'>"] = require('telescope-live-grep-args.actions').quote_prompt(),
          ['<C-k>'] = actions.cycle_history_prev,
        },
      },
    },
  },
})

telescope.load_extension('live_grep_args')
telescope.load_extension('notify')
telescope.load_extension('fzf')

vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest, { noremap = true, desc = 'List spelling suggestions' })
vim.keymap.set('', '<Leader>m', telescope_builtin.keymaps, { noremap = true, desc = 'List commands' })
vim.keymap.set('', '<Leader><CR>', telescope_builtin.commands, { noremap = true, desc = 'List commands' })
vim.keymap.set('', '<Leader>t', telescope_builtin.buffers, { noremap = true, desc = 'List buffers' })
vim.keymap.set({ '', 't', 'i' }, '<F1>', telescope_builtin.help_tags, { noremap = true, desc = 'Search help tags' })
vim.keymap.set('', '<Leader>o', telescope_builtin.oldfiles, { noremap = true, desc = 'List previously open files' })
vim.keymap.set('', '<Leader>gb', telescope_builtin.git_branches, { noremap = true, desc = 'List git branches' })
vim.keymap.set('', '<Leader>gc', telescope_builtin.git_commits, { noremap = true, desc = 'List git commits' })
vim.keymap.set('', '<Leader>gs', telescope_builtin.git_stash, { noremap = true, desc = 'List stash items' })
vim.keymap.set('', '<Leader>q', telescope_builtin.quickfix, { noremap = true, desc = 'List quickfix items' })
vim.keymap.set('', '<Leader>/', telescope.extensions.live_grep_args.live_grep_args, { noremap = true, desc = 'Live grep' })

vim.keymap.set('', '<Leader>f', function()
  if vim.b.gitsigns_head then
    telescope_builtin.git_files()
  else
    telescope_builtin.find_files()
  end
end, { noremap = true, desc = 'Search for files' })
