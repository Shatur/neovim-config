if exists('g:started_by_firenvim')
  finish
endif

nnoremap <Leader>gs <Cmd>G<CR>
nnoremap <Leader>gD <Cmd>G difftool -y<CR>
nnoremap <Leader>gd <Cmd>SwitchToNormalBuffer<CR><Cmd>Gdiffsplit<CR>
nnoremap <Leader>gp <Cmd>G push<CR>
