vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1

vim.g.nvim_tree_icons = {
  default = '',
    git = {
      unstaged = '',
      staged = '',
      unmerged = '',
      renamed = '',
      untracked = '',
      deleted = ''
    }
}

vim.g.nvim_tree_bindings = {
  ['l'] = '<Cmd>lua require"nvim-tree".on_keypress("edit")<CR>',
  ['h'] = '<Cmd>lua require"nvim-tree".on_keypress("close_node")<CR>',
}

-- Setup git highlights
vim.cmd('highlight! link NvimTreeGitDirty Function')
vim.cmd('highlight! link NvimTreeGitStaged diffAdded')
vim.cmd('highlight! link NvimTreeGitMerge diffIndexLine')
vim.cmd('highlight! link NvimTreeGitRenamed diffChanged')
vim.cmd('highlight! link NvimTreeGitNew diffNewFile')
vim.cmd('highlight! link NvimTreeGitDeleted diffRemoved')

-- Disable executable decoration
vim.cmd('highlight! default NvimTreeExecFile guifg=none guibg=none gui=NONE')
