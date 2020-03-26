call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

imap <C-Space> <Plug>(asyncomplete_force_refresh)

" Fix conflict with pear-tree
imap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : '<Plug>(PearTreeExpand)'
