vim.g.fzf_checkout_git_options = '--sort=-committerdate'
vim.g.fzf_checkout_previous_ref_first = false
vim.g.fzf_branch_actions = {
  checkout = {
    execute = 'call asyncrun#run("", {}, "{git} checkout {branch}")'
  },
  track = {
    execute = 'call asyncrun#run("", {}, "{git} checkout --track {branch}")'
  },
  create = {
    execute = 'call asyncrun#run("", {}, "{git} checkout -b {input}")'
  },
  delete = {
    execute = 'call asyncrun#run("", {}, "{git} branch -D {branch}")'
  },
  merge ={
    execute = 'call asyncrun#run("", {}, "{git} merge {branch}")'
  },
  rebase ={
    execute = 'call asyncrun#run("", {}, "{git} rebase {branch}")'
  },
}

vim.g.fzf_tag_actions = {
  checkout = {
    execute = 'call asyncrun#run("", {}, "{git} checkout {tag}")'
  },
  create = {
    execute = 'call asyncrun#run("", {}, "{git} tag {input}")'
  },
  delete = {
    execute = 'call asyncrun#run("", {}, "{git} branch -D {tag}")'
  },
}

vim.api.nvim_set_keymap('n', '<A-b>', '<Cmd>SwitchToNormalBuffer<CR><Cmd>GBranches<CR>', { noremap = true })
