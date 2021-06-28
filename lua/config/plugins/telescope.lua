local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    mappings = {
      i = {
        ['<C-v>'] = false,
        ['<C-x>'] = actions.select_vertical,
        ['<C-q>'] = actions.close,
        ['<C-CR>'] = actions.smart_send_to_qflist + actions.open_qflist,
      },
      n = {
        ['<C-q>'] = actions.close,
      }
    }
  },
  pickers = {
    git_commits = {
      mappings = {
        i = {
          ["<C-o>"] = function(prompt_bufnr)
            actions.close(prompt_bufnr)
            local value = actions.get_selected_entry(prompt_bufnr).value
            vim.cmd('DiffviewOpen ' .. value .. '~1..' .. value)
          end,
        }
      }
    }
  }
}

telescope.load_extension('dap')
telescope.load_extension('asynctasks')
telescope.load_extension('cmake')
telescope.load_extension('session_manager')

vim.api.nvim_set_keymap('n', '<A-b>', '<Cmd>Telescope git_branches theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-p>', '<Cmd>Telescope session_manager load theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', '<Cmd>Telescope spell_suggest theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<S-CR>', '<Cmd>Telescope commands theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-CR>', '<Cmd>Telescope commands theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope buffers theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F1>', '<Cmd>Telescope help_tags theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Cmd>Telescope help_tags theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-o>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-o>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope oldfiles theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files hidden=true theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-p>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope find_files hidden=true theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-t>', '<Cmd>Telescope asynctasks all theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-t>', '<Cmd>Telescope asynctasks all theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-c>', '<Cmd>Telescope git_commits theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-c>', '<Cmd>Telescope git_commits theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-s>', '<Cmd>Telescope git_stash theme=get_dropdown<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-s>', '<Cmd>Telescope git_stash theme=get_dropdown<CR>', { noremap = true })
if vim.fn.has('win32') == 1 then
  vim.api.nvim_set_keymap('', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-_>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
else
  vim.api.nvim_set_keymap('', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
  vim.api.nvim_set_keymap('i', '<C-/>', '<Cmd>SwitchToNormalBuffer<CR><Esc><Cmd>Telescope live_grep theme=get_dropdown<CR>', { noremap = true })
end
