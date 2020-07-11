let g:vista_echo_cursor = v:false
let g:vista_executive_for = {
      \ 'gdscript': 'nvim_lsp',
      \ 'cpp': 'nvim_lsp',
      \ 'python': 'nvim_lsp',
      \ 'markdown': 'toc',
      \ }

nnoremap <A-v> <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista!!<CR>
nnoremap <A-t> <Cmd>SwitchToNormalBuffer<CR><Cmd>Vista finder<CR>
