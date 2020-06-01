let g:fern#renderer = 'devicons'
let g:fern#disable_default_mappings = v:true

nnoremap <A-f> <Cmd>execute 'Fern ' . asyncrun#get_root('%') . ' -reveal=%:h -drawer -toggle -keep'<CR>
