autocmd vimrc User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd', '--header-insertion=never', '--background-index', '-j=8', '--clang-tidy', '--clang-tidy-checks=bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,modernize-use-*,-modernize-use-trailing-return-type']},
    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
    \ 'semantic_highlight': {
    \       'entity.name.function.cpp': 'Function',
    \       'entity.name.function.method.cpp': 'Function',
    \       'entity.name.namespace.cpp': 'Type',
    \       'entity.name.type.class.cpp': 'Type',
    \       'entity.name.type.enum.cpp': 'Type',
    \       'entity.name.type.template.cpp': 'Type',
    \       'variable.other.cpp': 'Identifier',
    \       'variable.other.enumnumber.cpp': 'Identifier',
    \       'variable.other.field.cpp': 'MemberVariable'
    \ }
    \ })
autocmd vimrc User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python']
    \ })
autocmd vimrc User lsp_setup call lsp#register_server({
    \ 'name': 'godot',
    \ 'cmd': {server_info->['nc', 'localhost', '6008']},
    \ 'whitelist': ['gdscript3']
    \ })

let g:lsp_semantic_enabled = 1
let g:lsp_signs_error = {'text': ''}
let g:lsp_signs_warning = {'text': ''}
let g:lsp_signs_hint = {'text': ''}

highlight MemberVariable ctermfg=DarkRed guifg=#9c3a3a
highlight link LspWarningText Underlined

nmap <A-CR> <plug>(lsp-code-action)
nmap <A-i> V<plug>(lsp-document-range-format)
vmap <A-i> <plug>(lsp-document-range-format)
imap <A-i> <C-o>V<plug>(lsp-document-range-format)
nmap gd <plug>(lsp-declaration)
nmap <A-LeftRelease> <plug>(lsp-declaration)
nmap gD <plug>(lsp-peek-declaration)
nmap K <plug>(lsp-hover)
nmap gR <plug>(lsp-rename)
nmap gr <plug>(lsp-references)
nmap gs <plug>(lsp-workspace-symbol)
nmap ]d <plug>(lsp-next-diagnostic)
nmap [d <plug>(lsp-previous-diagnostic)
nmap <Space>s <plug>(lsp-clangd-switch)
