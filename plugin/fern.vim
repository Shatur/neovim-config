let g:fern#renderer = 'devicons'
let g:fern#disable_default_mappings = v:true

autocmd vimrc BufEnter * ++nested call vimrc#fern#HijackDirectory()

nnoremap <A-f> <Cmd>execute 'Fern ' . asyncrun#get_root('%') . ' -reveal=% -drawer -toggle -keep'<CR>
