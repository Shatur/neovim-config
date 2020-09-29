" Fugitive integration
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:asyncrun_open = 10
let g:asyncrun_rootmarks = ['.git', '.compile_commands.json']

noremap <C-t> <Cmd>call asyncrun#quickfix_toggle(10)<CR>
inoremap <C-t> <Esc><Cmd>call asyncrun#quickfix_toggle(10)<CR>
noremap <C-BS> <Cmd>AsyncStop<CR>
inoremap <C-BS> <Esc><Cmd>AsyncStop<CR>
nnoremap <A-y> <Cmd>call asyncrun#run('', {}, 'git pull --rebase')<CR>
noremap <Leader>rcd <Cmd>execute 'cd ' . asyncrun#get_root('%')<CR>
