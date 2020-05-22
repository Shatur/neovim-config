" This plugin used only for fast semantic highlighting
let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd', '--background-index', '-j=8', '--pch-storage=memory'],
      \ }

let g:LanguageClient_semanticHighlightMaps = {
      \ 'cpp': {
      \   'entity.name.function.cpp': 'Function',
      \   'entity.name.function.method.*': 'Function',
      \   'entity.name.function.preprocessor.cpp': 'Number',
      \   'storage.type.primitive.*': 'Type',
      \   'variable.other.field.cpp': 'markdownHeadingDelimiter',
      \   'variable.other.field.static.cpp': 'Number',
      \   'variable.other.enummember.cpp': 'Type',
      \   'variable.other.cpp': 'Identifier',
      \   'variable.other.local.cpp': 'Identifier',
      \   'variable.parameter.cpp': 'Identifier',
      \   'entity.name.namespace.cpp': 'Type',
      \   'entity.name.type.*': 'Type',
      \ }
      \ }

" Disable completion and diagnostics
let g:LanguageClient_diagnosticsEnable = 0
autocmd vimrc VimEnter * autocmd! languageClient CompleteDone *
