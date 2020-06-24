autocmd OptionSet background call vimrc#lightline#reloadColorscheme()

let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unnamed = '[Нет имени]'
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#modified = ' '
let g:lightline#bufferline#show_number = 2

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [['mode', 'paste'], ['branch'], ['filename', 'asyncrun']],
      \   'right': [['percent', 'lineinfo'], ['fileformat'], ['function', 'filetype']]
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
      \   'tabs': 'vimrc#lightline#Tabs',
      \ },
      \ 'component_function': {
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

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
