let g:completion_auto_change_source = 1
let g:completion_enable_snippet = 'vim-vsnip'
let g:completion_confirm_key = ''

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['lsp', 'snippet']},
    \       {'complete_items': ['path'], 'triggered_only': ['/']},
    \       {'complete_items': ['buffers']}]
    \   }
    \}

let g:completion_customize_lsp_label = {
      \ 'Function': '',
      \ 'Method': '',
      \ 'Reference': '',
      \ 'Enum': '',
      \ 'Field': 'ﰠ',
      \ 'Keyword': '',
      \ 'Variable': '',
      \ 'Folder': '',
      \ 'Snippet': '',
      \ 'Operator': '',
      \ 'Module': '',
      \ 'Text': 'ﮜ',
      \ 'Buffers': '',
      \ 'Class': '',
      \ 'Interface': ''
      \}

" Use completion-nvim in every buffer
autocmd vimrc BufEnter * lua require'completion'.on_attach()

imap <expr> <CR> pumvisible() ? complete_info()['selected'] != '-1' ? '<Plug>(completion_confirm_completion)' : '<C-e><CR>' : '<Plug>(PearTreeExpand)'

imap <A-j> <cmd>lua require'source'.prevCompletion()<CR>
imap <A-k> <cmd>lua require'source'.nextCompletion()<CR>

inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
inoremap <silent><expr> <C-Space> completion#trigger_completion()

