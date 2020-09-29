if exists('g:vscode')
  finish
endif

let g:terminal_default_mapping = v:false
let g:terminal_list = v:false
let g:terminal_height = 15
let g:terminal_fixheight = v:true

noremap <A-t> <Cmd>call TerminalToggle()<CR>
inoremap <A-t> <Esc><Cmd>call TerminalToggle()<CR>
tnoremap <A-t> <Cmd>call TerminalToggle()<CR>
