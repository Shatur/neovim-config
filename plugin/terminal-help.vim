let g:terminal_default_mapping = v:false
let g:terminal_list = v:false
let g:terminal_height = 15

nnoremap <F4> <Cmd>call TerminalToggle()<CR>
inoremap <F4> <Esc><Cmd>call TerminalToggle()<CR>
vnoremap <F4> <Cmd>call TerminalToggle()<CR>
tnoremap <F4> <Cmd>call TerminalToggle()<CR>
