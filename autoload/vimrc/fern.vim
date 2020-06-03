function! vimrc#fern#HijackDirectory() abort
  if !isdirectory(expand('%'))
    return
  endif
  bwipeout %
  Fern %
endfunction
