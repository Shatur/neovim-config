imap <expr><CR>  complete_info(['selected']).selected != -1 ? compete#close({ 'confirm': v:true })  : '<Plug>(PearTreeExpand)'
imap <expr><Esc> complete_info(['selected']).selected != -1 ? compete#close({ 'confirm': v:false }) : '<Esc>'
imap <C-Space> <Plug>(compete-force-refresh)

let g:compete_min_length = 3
