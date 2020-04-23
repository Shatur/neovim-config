" Initialize servers
autocmd! vimrc User lamp#initialized call s:on_initialized()
function! s:on_initialized()
  call lamp#builtin#vim_language_server()

  call lamp#register('clangd', {
        \   'command': ['clangd', '--header-insertion=never', '--suggest-missing-includes', '--background-index', '-j=8', '--cross-file-rename', '--pch-storage=memory', '--clang-tidy', '--clang-tidy-checks=bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,modernize-use-*,-modernize-use-trailing-return-type'],
        \   'filetypes': ['cpp'],
        \   'root_uri': { -> lamp#findup(['.git', 'compile_commands.json']) },
        \   'initialization_options': { -> {
        \   } },
        \   'capabilitis': {
        \     'completionProvider': {
        \       'triggerCharacters': ['.', ',']
        \     }
        \   }
        \ })
  call lamp#register('godot', {
        \   'command': ['nc', 'localhost', '6008'],
        \   'filetypes': ['gdscript3'],
        \   'root_uri': { -> lamp#findup(['.git', 'project.godot']) },
        \   'initialization_options': { -> {
        \   } },
        \   'capabilitis': {
        \     'completionProvider': {
        \       'triggerCharacters': ['.', ',']
        \     }
        \   }
        \ })
endfunction

" Initialize buffers
autocmd! vimrc User lamp#text_document_did_open call s:on_text_document_did_open()
function! s:on_text_document_did_open() abort
  " Completion
  setlocal omnifunc=lamp#complete

  " Commands
  nnoremap <buffer><silent> K :<C-u>LampHover<CR>
  nnoremap <buffer><silent> <A-CR> :<C-u>LampCodeAction<CR>
  vnoremap <buffer><silent> <A-CR> :LampCodeAction<CR>
  vnoremap <buffer><silent> <A-i> :LampRangeFormatting<CR>
  nnoremap <buffer><silent> <A-i> :<C-u>LampFormatting<CR>
  inoremap <buffer><silent> <A-i> <C-o>:<C-u>LampFormatting<CR>
  nnoremap <buffer><silent> gd :<C-u>LampDefinition edit<CR>
  nnoremap <buffer><silent> gD :<C-u>LampTypeDefinition edit<CR>
  nnoremap <buffer><silent> <A-LeftRelease> :<C-u>LampDefinition edit<CR>
  nnoremap <buffer><silent> gr :<C-u>LampRename<CR>
  nnoremap <buffer><silent> gR :<C-u>LampReferences<CR>
  nnoremap <buffer><silent> <Space>s :LampSwitchSourceHeader<CR>
endfunction
