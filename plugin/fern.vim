let g:fern#renderer = 'devicons'
let g:fern#disable_default_mappings = v:true

" Disable netrw
let g:loaded_netrw = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_netrwFileHandlers = v:true

function! s:hijack_directory() abort
  if !isdirectory(expand('%'))
    return
  endif
  bwipeout %
  Fern %
endfunction

autocmd vimrc BufEnter * ++nested call s:hijack_directory()

nnoremap <A-f> <Cmd>execute 'Fern ' . asyncrun#get_root('%') . ' -reveal=%:h -drawer -toggle -keep'<CR>
