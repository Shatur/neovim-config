if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_checkout_execute = 'call asyncrun#run("", {}, "{git} checkout {branch}")'
let g:fzf_checkout_track_execute = 'call asyncrun#run("", {}, "{git} checkout --track {branch}")'
let g:fzf_checkout_create_execute = 'call asyncrun#run("", {}, "{git} checkout -b {branch}")'

nnoremap <A-b> <Cmd>SwitchToNormalBuffer<CR><Cmd>GCheckout<CR>
