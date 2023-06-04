vim.g.fugitive_legacy_commands = false

vim.keymap.set('', '<Leader>gg', '<Cmd>vert Git<CR>))', { noremap = true, desc = 'Open Fugitive' })
vim.keymap.set('', '<Leader>gP', function() vim.cmd.Git('pull') end, { noremap = true, desc = 'Git pull' })
vim.keymap.set('', '<Leader>gp', function() vim.cmd.Git('push') end, { noremap = true, desc = 'Git push' })
vim.keymap.set('', '<Leader>gfp', function() vim.cmd.Git('push --force') end, { noremap = true, desc = 'Git push (force)' })

vim.api.nvim_create_autocmd({ 'BufAdd' }, {
  pattern = 'fugitive://*',
  group = 'Config',
  callback = function()
    if vim.wo.diff then
      vim.wo.winhighlight = 'DiffAdd:DiffDelete'
    end
  end,
})
