if exists('g:vscode')
  finish
endif

scriptencoding utf-8

let g:completion_auto_change_source = 1
let g:completion_confirm_key = ''

let g:completion_chain_complete_list = {
    \ 'default' : {
    \   'default': [
    \       {'complete_items': ['buffers']},
    \       {'complete_items': ['path'], 'triggered_only': ['/']}]
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

inoremap <silent><expr> <C-Space> completion#trigger_completion()

imap <expr> <Tab> pumvisible() ? '<Down>' : '<Tab>'
smap <expr> <Tab> pumvisible() ? '<Down>' : '<Tab>'
imap <expr> <C-Tab> pumvisible() ? '<Up>' : <C-Tab> 
smap <expr> <C-Tab> pumvisible() ? '<Up>' : <C-Tab> 
