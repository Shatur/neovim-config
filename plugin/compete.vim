imap <expr><CR>  complete_info(['selected']).selected != -1 ? compete#close({ 'confirm': v:true })  : "<plug>(PearTreeExpand)"
imap <expr><Esc> complete_info(['selected']).selected != -1 ? compete#close({ 'confirm': v:false }) : "\<Esc>"
imap <C-Space> <plug>(compete-force-refresh)

let g:compete_min_length = 3
