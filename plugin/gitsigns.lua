require('gitsigns').setup({
  signs = {
    add = { text = '▎' },
    change = { text = '▎' },
    delete = { text = '▎' },
    topdelete = { text = '▔' },
    changedelete = { text = '▋' },
  },
  preview_config = {
    border = 'rounded',
  },
  on_attach = function(bufnr)
    -- Navigation
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']c', "&diff ? ']c' : '<Cmd>Gitsigns next_hunk<CR>'", { noremap = true, silent = true, expr = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[c', "&diff ? '[c' : '<Cmd>Gitsigns prev_hunk<CR>'", { noremap = true, silent = true, expr = true })

    -- Actions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<Cmd>Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hs', '<Cmd>Gitsigns stage_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hr', '<Cmd>Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hr', '<Cmd>Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hS', '<Cmd>Gitsigns stage_buffer<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hu', '<Cmd>Gitsigns undo_stage_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hR', '<Cmd>Gitsigns reset_buffer<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<Cmd>Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hb', '<Cmd>lua require("gitsigns").blame_line({full=true})<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>tb', '<Cmd>Gitsigns toggle_current_line_blame<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hd', '<Cmd>Gitsigns diffthis<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hD', '<Cmd>lua require("gitsigns").diffthis("~")<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>td', '<Cmd>Gitsigns toggle_deleted<CR>', { noremap = true, silent = true })

    -- Text object
    vim.api.nvim_buf_set_keymap(bufnr, 'o', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'x', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { noremap = true, silent = true })
  end,
})
