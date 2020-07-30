if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

nnoremap <Leader>gf <Cmd>SwitchToNormalBuffer<CR><Cmd>Flog -all<CR>
