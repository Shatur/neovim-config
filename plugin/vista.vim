if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:vista_echo_cursor = v:false

nnoremap <A-v> <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista!!<CR>
nnoremap <A-t> <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista finder<CR>
