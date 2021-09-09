local telescope = require('telescope')
local actions = require('telescope.actions')

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
      theme = 'dropdown',
    },
    buffers = {
      theme = 'dropdown',
    },
    oldfiles = {
      theme = 'dropdown',
    },
    git_branches = {
      theme = 'dropdown',
    },
    find_files = {
      theme = 'dropdown',
      hidden = true,
    },
    git_commits = {
      mappings = {
        i = {
          ['<C-o>'] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = actions.get_selected_entry(prompt_bufnr).value
            vim.api.nvim_command('DiffviewOpen ' .. value .. '~1..' .. value)
          end,
        },
      },
    },
  },
})

telescope.load_extension('dap')
telescope.load_extension('asynctasks')
telescope.load_extension('cmake')
telescope.load_extension('sessions')

vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Telescope spell_suggest<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-CR>', '<Cmd>Telescope commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<Cmd>Telescope commands<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-Tab>', '<Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F1>', '<Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Cmd>Telescope help_tags<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-o>', '<Cmd>Telescope oldfiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-o>', '<Cmd>Telescope oldfiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-b>', '<Cmd>Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-b>', '<Cmd>Telescope git_branches<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-p>', '<Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-c>', '<Cmd>Telescope git_commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-c>', '<Cmd>Telescope git_commits<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-s>', '<Cmd>Telescope git_stash<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-s>', '<Cmd>Telescope git_stash<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-t>', '<Cmd>Telescope asynctasks all theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-t>', '<Cmd>Telescope asynctasks all theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-p>', '<Cmd>SaveSession<CR><Cmd>Telescope sessions theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-p>', '<Cmd>SaveSession<CR><Cmd>Telescope sessions theme=get_dropdown<CR>', { noremap = true })
if vim.fn.has('win32') == 1 then
  vim.api.nvim_set_keymap('', '<C-/>', '<Cmd>Telescope live_grep<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-/>', '<Esc><Cmd>Telescope live_grep<CR>', { noremap = true })
else
  vim.api.nvim_set_keymap('', '<C-_>', '<Cmd>Telescope live_grep<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-_>', '<Esc><Cmd>Telescope live_grep<CR>', { noremap = true })
end
