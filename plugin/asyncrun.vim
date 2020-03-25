" Fugitive integration
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:asyncrun_open = 10

noremap <silent> <F3> :call asyncrun#quickfix_toggle(10)<CR>
