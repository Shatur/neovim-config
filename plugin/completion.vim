let g:completion_auto_change_source = v:true
let g:completion_confirm_key = ''

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['lsp', 'snippet', 'buffers']},
    \       {'complete_items': ['path'], 'triggered_only': ['/']},
    \       {'mode': '<C-p>'},
    \       {'mode': '<C-n>'}]
    \   }
    \}

" Use completion-nvim in every buffer
autocmd vimrc BufEnter * lua require'completion'.on_attach()

imap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(completion_confirm_completion)" : "\<C-e>\<CR>" : "\<CR>"

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-Space> completion#trigger_completion()
