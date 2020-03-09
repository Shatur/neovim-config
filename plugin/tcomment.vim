if has('win32')
  inoremap <C-/> <Esc>:TComment<CR>
  nnoremap <C-/> :TComment<CR>
  vnoremap <C-/> :TComment<CR>
  let g:tcomment_mapleader1 = '<A-/>'
else
  inoremap <C-_> <Esc>:TComment<CR>
  nnoremap <C-_> :TComment<CR>
  vnoremap <C-_> :TComment<CR>
  let g:tcomment_mapleader1 = '<A-_>'
endif
