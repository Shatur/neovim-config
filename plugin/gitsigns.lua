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
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<Leader>hs', gs.stage_hunk, { buffer = bufnr })
    vim.keymap.set({ 'n', 'v' }, '<Leader>hr', gs.reset_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hS', gs.stage_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hR', gs.reset_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hp', gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hb', function() gs.blame_line({ full = true }) end, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hd', gs.diffthis, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>hD', function() gs.diffthis('~') end, { buffer = bufnr })
    vim.keymap.set('n', '<Leader>td', gs.toggle_deleted, { buffer = bufnr })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-u>Gitsigns select_hunk<CR>', { buffer = bufnr })
  end,
})
