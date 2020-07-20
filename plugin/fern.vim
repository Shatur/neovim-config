let g:fern#renderer = 'devicons'
let g:fern#disable_default_mappings = v:true

autocmd vimrc BufEnter * ++nested call vimrc#fern#HijackDirectory()

noremap <A-f> <Cmd>execute 'Fern ' . fnameescape(asyncrun#get_root('%')) . ' -reveal=' . expand('%:p') . ' -drawer -toggle -keep'<CR>
