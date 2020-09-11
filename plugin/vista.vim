if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

let g:vista_echo_cursor = v:false

nnoremap gO <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista finder<CR>
nnoremap <A-v> <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista!!<CR>
