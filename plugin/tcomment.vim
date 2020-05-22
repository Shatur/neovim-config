if has('win32')
  inoremap <C-/> <Cmd>TComment<CR>
  nnoremap <C-/> <Cmd>TComment<CR>
  vnoremap <C-/> <Cmd>TComment<CR>
  let g:tcomment_mapleader1 = '<A-/>'
else
  inoremap <C-_> <Cmd>TComment<CR>
  nnoremap <C-_> <Cmd>TComment<CR>
  vnoremap <C-_> <Cmd>TComment<CR>
  let g:tcomment_mapleader1 = '<A-_>'
endif
