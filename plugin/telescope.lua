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
        ['<C-k>'] = actions.cycle_history_next,
        ['<C-j>'] = actions.cycle_history_prev,
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
    git_branches = {
      theme = 'dropdown',
      pattern = '--sort=-committerdate',
    },
    git_commits = {
      mappings = {
        i = {
          ['<C-o>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = action_state.get_selected_entry().value
            vim.api.nvim_command('G difftool -y ' .. value .. '~1..' .. value)
          end,
        },
      },
    },
  },
})

telescope.load_extension('dap')
telescope.load_extension('live_grep_raw')
telescope.load_extension('yabs')
telescope.load_extension('notify')
pcall(telescope.load_extension, 'fzf') -- Load only if compiled

vim.keymap.set('n', 'z=', telescope_builtin.spell_suggest, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<S-CR>', telescope_builtin.commands, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<C-Tab>', telescope_builtin.buffers, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<F1>', telescope_builtin.help_tags, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<A-o>', telescope_builtin.oldfiles, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<A-b>', telescope_builtin.git_branches, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<C-p>', telescope_builtin.find_files, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<A-c>', telescope_builtin.git_commits, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<A-s>', telescope_builtin.git_stash, { noremap = true })
vim.keymap.set({ '', 't', 'i' }, '<S-F3>', telescope_builtin.quickfix, { noremap = true })

vim.keymap.set({ '', 'i' }, '<C-/>', telescope.extensions.live_grep_raw.live_grep_raw, { noremap = true })
vim.keymap.set('t', '<C-/>', function()
  telescope.extensions.live_grep_raw.live_grep_raw()
  vim.api.nvim_input('i')
end, { noremap = true })
