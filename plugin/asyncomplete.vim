call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

let g:asyncomplete_auto_completeopt = 0

imap <C-Space> <Plug>(asyncomplete_force_refresh)

" Fix conflict with pear-tree
imap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "<Plug>(PearTreeExpand)"
imap <expr> <Esc> pumvisible() ? asyncomplete#cancel_popup() : "<Plug>(PearTreeFinishExpansion)"
