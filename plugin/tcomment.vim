if has('win32')
  inoremap <silent> <C-/> <Esc>:TComment<CR>
  nnoremap <silent> <C-/> :TCo<silent> mment<CR>
  vnoremap <silent> <C-/> :TComment<CR>
  let g:tcomment_mapleader1 = '<A-/>'
else
  inoremap <silent> <C-_> <Esc>:TComment<CR>
  nnoremap <silent> <C-_> :TComment<CR>
  vnoremap <silent> <C-_> :TComment<CR>
  let g:tcomment_mapleader1 = '<A-_>'
endif
