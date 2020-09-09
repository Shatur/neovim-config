if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_checkout_previous_ref_first = v:false
let g:fzf_branch_actions = {
      \ 'checkout': {
      \   'execute': 'call asyncrun#run("", {}, "{git} checkout {branch}")'
      \ },
      \ 'track': {
      \   'execute': 'call asyncrun#run("", {}, "{git} checkout --track {branch}")'
      \ },
      \ 'create': {
      \   'execute': 'call asyncrun#run("", {}, "{git} checkout -b {input}")'
      \ },
      \ 'delete': {
      \   'execute': 'call asyncrun#run("", {}, "{git} branch -D {branch}")'
      \ },
      \ 'merge':{
      \   'execute': 'call asyncrun#run("", {}, "{git} merge {branch}")'
      \ },
      \ 'rebase':{
      \   'execute': 'call asyncrun#run("", {}, "{git} rebase {branch}")'
      \ },
      \}

let g:fzf_tag_actions = {
      \ 'checkout': {
      \   'execute': 'call asyncrun#run("", {}, "{git} checkout {tag}")'
      \ },
      \ 'create': {
      \   'execute': 'call asyncrun#run("", {}, "{git} tag {input}")'
      \ },
      \ 'delete': {
      \   'execute': 'call asyncrun#run("", {}, "{git} branch -D {tag}")'
      \ },
      \}

nnoremap <A-b> <Cmd>SwitchToNormalBuffer<CR><Cmd>GBranches<CR>
