if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

scriptencoding utf-8

autocmd vimrc OptionSet background call vimrc#lightline#reloadColorscheme()

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [['mode', 'multicursors', 'paste'], ['branch'], ['filename', 'asyncrun']],
      \   'right': [['cursorscount', 'percent', 'lineinfo'], ['fileformat'], ['function', 'filetype']]
      \ },
      \ 'inactive': {
      \   'left': [['filename', 'asyncrun']],
      \   'right': [['percent', 'lineinfo']]
      \ },
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [['tabs']]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \   'tabs': 'vimrc#lightline#Tabs'
      \ },
      \ 'component_function': {
      \   'multicursors': 'vimrc#lightline#Multicursors',
      \   'cursorscount': 'vimrc#lightline#CursorsCount',
      \   'filetype': 'vimrc#lightline#Filetype',
      \   'fileformat': 'vimrc#lightline#Fileformat',
      \   'filename': 'vimrc#lightline#Filename',
      \   'function': 'vimrc#lightline#NearestFunction',
      \   'branch': 'vimrc#lightline#Branch',
      \   'asyncrun': 'vimrc#lightline#Asyncrun'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_raw': {
      \   'buffers': 1
      \ }
      \ }
