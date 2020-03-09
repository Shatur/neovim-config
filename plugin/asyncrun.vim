" Fugitive integration
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

let g:asyncrun_open = 10

noremap <F3> :call asyncrun#quickfix_toggle(8)<CR>
