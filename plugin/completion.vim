let g:completion_confirm_key_rhs = "\<Plug>(PearTreeExpand)"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-Space> completion#trigger_completion()
