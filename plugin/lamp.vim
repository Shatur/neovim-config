" Initialize servers
autocmd! vimrc User lamp#initialized call s:on_initialized()
function! s:on_initialized()
  call lamp#config('view.sign.error.text', '')
  call lamp#config('view.sign.warning.text', '')
  call lamp#config('view.sign.information.text', 'i')
  call lamp#config('view.sign.hint.text', '')

  call lamp#builtin#vim_language_server()

  call lamp#register('clangd', {
        \   'command': ['clangd', '--header-insertion=never', '--suggest-missing-includes', '--background-index', '-j=8', '--cross-file-rename', '--pch-storage=memory', '--clang-tidy', '--clang-tidy-checks=-clang-analyzer-*,bugprone-*,misc-*,-misc-non-private-member-variables-in-classes,performance-*,-performance-no-automatic-move,modernize-use-*,-modernize-use-nodiscard,-modernize-use-trailing-return-type'],
        \   'filetypes': ['cpp', 'c'],
        \   'root_uri': { -> lamp#findup(['.git', 'compile_commands.json']) },
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
        \ })
  call lamp#register('bash-language-server', {
        \   'command': ['bash-language-server', 'start'],
        \   'filetypes': ['sh', 'bash'],
        \ })
  call lamp#register('cmake-language-server', {
        \   'command': ['cmake-language-server'],
        \   'filetypes': ['cmake'],
        \   'initialization_options': { -> {
        \     'buildDirectory': cmake#get_build_dir()
        \   } }
        \ })
endfunction

" Initialize buffers
autocmd! vimrc User lamp#text_document_did_open call s:on_text_document_did_open()
function! s:on_text_document_did_open() abort
  " Completion
  setlocal omnifunc=lamp#complete

  " Commands
  nnoremap <buffer><silent> K <Cmd>LampHover<CR>
  nnoremap <buffer><silent> <A-CR> <Cmd>LampCodeAction<CR>
  vnoremap <buffer><silent> <A-CR> <Cmd>LampCodeAction<CR>
  vnoremap <buffer><silent> <A-i> <Cmd>LampRangeFormatting<CR>
  nnoremap <buffer><silent> <A-i> <Cmd>LampRangeFormatting<CR>
  inoremap <buffer><silent> <A-i> <Cmd>LampRangeFormatting<CR>
  nnoremap <buffer><silent> gd <Cmd>LampDefinition edit<CR>
  nnoremap <buffer><silent> gD <Cmd>LampTypeDefinition edit<CR>
  nnoremap <buffer><silent> <C-LeftMouse> <LeftMouse><Cmd>LampDefinition edit<CR>
  nnoremap <buffer><silent> gr <Cmd>LampRename<CR>
  nnoremap <buffer><silent> gR <Cmd>LampReferences<CR>
  nnoremap <buffer><silent> gs <Cmd>LampSwitchSourceHeader<CR>
  nnoremap <buffer><silent> ]d <Cmd>LampDiagnosticsNext<CR>
  nnoremap <buffer><silent> [d <Cmd>LampDiagnosticsPrev<CR>
endfunction

command! LampSwitchSourceHeader call s:clangd_switch_source_header()
function! s:clangd_switch_source_header() abort
  if &filetype !=# 'cpp'
    return
  endif

  let l:server = lamp#server#registry#get_by_name('clangd')
  if empty(l:server)
    echomsg 'clangd does not exists'
    return
  endif

  let l:header = lamp#sync(l:server.request('textDocument/switchSourceHeader', {
              \ 'uri': lamp#protocol#document#identifier(bufnr('%')).uri
              \ }))
  if strlen(l:header) == 0
    echomsg 'source header does not found.'
    return
  endif
  execute printf('edit %s', fnameescape(lamp#protocol#document#decode_uri(l:header)))
endfunction

command! ReloadDocument call s:reload_document()
function! s:reload_document()
  let l:bufnr = bufnr('%')
  let l:bufname = bufname(l:bufnr)
  enew
  let l:temp_bufnr = bufnr('%')
  try
    execute printf('%sbdelete!', l:bufnr)
  catch /.*/
  endtry
  execute printf('edit! %s', fnameescape(l:bufname))
  try
    execute printf('%sbdelete!', l:temp_bufnr)
  catch /.*/
  endtry
endfunction
