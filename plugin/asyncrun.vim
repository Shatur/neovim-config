" Fugitive integration
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:asyncrun_open = 10
let g:asyncrun_rootmarks = ['.git', '.compile_commands.json']

noremap <silent> <F3> :call asyncrun#quickfix_toggle(10)<CR>
noremap <silent> <C-BS> :AsyncStop<CR>
