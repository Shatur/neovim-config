if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

nnoremap <A-g> <Cmd>G<CR>
nnoremap <Leader>gD <Cmd>G difftool -y<CR>
nnoremap <Leader>gd <Cmd>SwitchToNormalBuffer<CR><Cmd>Gdiffsplit<CR>
nnoremap <A-u> <Cmd>G push<CR>
