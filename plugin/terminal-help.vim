let g:terminal_default_mapping = v:false
let g:terminal_list = v:false
let g:terminal_height = 15

nnoremap <silent> <F4> :call TerminalToggle()<CR>
inoremap <silent> <F4> <Esc>:call TerminalToggle()<CR>
vnoremap <silent> <F4> <Esc>:call TerminalToggle()<CR>
tnoremap <silent> <F4> <C-\><C-n>:call TerminalToggle()<CR>
