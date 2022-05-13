local fzf = require('fzf-lua')
local actions = require('fzf-lua.actions')

local function show_commit(selected)
  local space = string.find(selected[1], ' ')
  local commit = string.sub(selected[1], 1, space - 1)
  vim.api.nvim_command('G difftool -y ' .. commit .. '~1..' .. commit)
end

local function show_stash(selected)
  local open_brace = string.find(selected[1], '{')
  local close_brace = string.find(selected[1], '}', open_brace)
  local stash = string.sub(selected[1], open_brace + 1, close_brace - 1)
  vim.api.nvim_command('G stash show -p ' .. stash)
end

fzf.setup({
  winopts = {
    on_create = function()
      vim.keymap.set('t', '<C-CR>', '<A-q>', { noremap = true, buffer = 0 })
    end,
  },
  keymap = {
    builtin = {
      ['<F1>'] = 'toggle-help',
      ['<F2>'] = 'toggle-fullscreen',
      ['<F3>'] = 'toggle-preview-wrap',
      ['<F4>'] = 'toggle-preview',
      ['<F5>'] = 'toggle-preview-ccw',
      ['<F6>'] = 'toggle-preview-cw',
      ['<C-d>'] = 'preview-page-down',
      ['<C-u>'] = 'preview-page-up',
      ['<S-left>'] = 'preview-page-reset',
    },
  },
  actions = {
    files = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-s'] = actions.file_vsplit,
      ['ctrl-x'] = actions.file_split,
      ['ctrl-t'] = actions.file_tabedit,
      ['alt-q'] = actions.file_sel_to_qf,
    },
    buffers = {
      ['default'] = actions.buf_edit,
      ['ctrl-s'] = actions.buf_vsplit,
      ['ctrl-x'] = actions.buf_split,
      ['ctrl-t'] = actions.buf_tabedit,
    },
  },
  git = {
    branches = {
      cmd = 'git branch --sort=-committerdate --all --color',
    },
    commits = {
      actions = {
        ['ctrl-o'] = show_commit,
      },
    },
    bcommits = {
      actions = {
        ['ctrl-o'] = show_commit,
      },
    },
    stash = {
      actions = {
        ['ctrl-o'] = show_stash,
      },
    },
  },
})

vim.keymap.set('n', 'z=', fzf.spell_suggest, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-CR>', fzf.commands, { noremap = true })
vim.keymap.set({ '', 'i' }, '<C-Tab>', fzf.buffers, { noremap = true })
vim.keymap.set({ '', 'i' }, '<F1>', fzf.help_tags, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-o>', fzf.oldfiles, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-b>', fzf.git_branches, { noremap = true })
vim.keymap.set({ '', 'i' }, '<C-p>', fzf.files, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-c>', fzf.git_commits, { noremap = true })
vim.keymap.set({ '', 'i' }, '<A-s>', fzf.git_stash, { noremap = true })
vim.keymap.set({ '', 'i' }, '<S-F3>', fzf.quickfix, { noremap = true })

vim.keymap.set({ '', 'i' }, '<C-/>', fzf.live_grep_resume, { noremap = true })
vim.keymap.set('t', '<C-/>', function()
  fzf.live_grep_native()
  vim.api.nvim_input('i')
end, { noremap = true })
