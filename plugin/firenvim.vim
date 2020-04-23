if exists('g:started_by_firenvim')
  set laststatus=0

  let g:airline_disable_statusline = 1
  let g:webdevicons_enable = 0
  let g:lsp_auto_enable = 0
  let g:startify_disable_at_vimenter = 1
  let loaded_nerd_tree = 0

  autocmd vimrc FocusLost * ++nested write

  nnoremap <silent> <Esc><Esc> :call firenvim#focus_page()<CR>
  nnoremap <silent> <C-z> :write<CR>:call firenvim#hide_frame()<CR>
endif
