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
    end, { expr = true, buffer = bufnr, desc = 'Jump to next sign' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, buffer = bufnr, desc = 'Jump to previous sign' })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<Leader>hs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>hr', gs.reset_hunk, { buffer = bufnr, desc = 'Reset hunk' })
    vim.keymap.set('n', '<Leader>hS', gs.stage_buffer, { buffer = bufnr, desc = 'Stage buffer' })
    vim.keymap.set('n', '<Leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage hunk' })
    vim.keymap.set('n', '<Leader>hR', gs.reset_buffer, { buffer = bufnr, desc = 'Reset buffer' })
    vim.keymap.set('n', '<Leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
    vim.keymap.set('n', '<Leader>hb', function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = 'Blame line' })
    vim.keymap.set('n', '<Leader>tb', gs.toggle_current_line_blame, { buffer = bufnr, desc = 'Toggle current line blame' })
    vim.keymap.set('n', '<Leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Diffthis' })
    vim.keymap.set('n', '<Leader>hD', function() gs.diffthis('~') end, { buffer = bufnr, desc = 'Diffthis against ~' })
    vim.keymap.set('n', '<Leader>td', gs.toggle_deleted, { buffer = bufnr, desc = 'Toggle deleted' })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-u>Gitsigns select_hunk<CR>', { buffer = bufnr, desc = 'Select hunk' })
  end,
})
