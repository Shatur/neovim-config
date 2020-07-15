scriptencoding utf-8

function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) . " " . entry_path'
endfunction

let g:startify_custom_header = [
      \'    _   _                 _           ',
      \'   | \ | | ___  _____   _(_)_ __ ___  ',
      \'   |  \| |/ _ \/ _ \ \ / / | `_ ` _ \ ',
      \'   | |\  |  __/ (_) \ V /| | | | | | |',
      \'   |_| \_|\___|\___/ \_/ |_|_| |_| |_|',
      \]

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Закладки'] },
      \ { 'type': 'files',     'header': ['   Последние файлы'] },
      \ { 'type': 'dir',       'header': ['   Текущая папка '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Сессии'] },
      \ { 'type': 'commands',  'header': ['   Команды'] },
      \ ]

let g:startify_skiplist = [
      \ 'start/.*/doc/.*\.txt',
      \ 'runtime/doc/.*\.txt',
      \ '/.git/',
      \ 'fugitiveblame$',
      \ '/run/user/',
      \ ]

let g:startify_change_to_vcs_root = 1

if has('win32')
  let g:startify_bookmarks = [ {'c': '~/AppData/Local/nvim/init.vim'} ]
else
  let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'} ]
endif

highlight link StartifyHeader String

noremap <C-n> <Cmd>SwitchToNormalBuffer<CR><Cmd>Startify<CR>
inoremap <C-n> <Esc><Cmd>SwitchToNormalBuffer<CR><Cmd>Startify<CR>
