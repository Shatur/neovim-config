if exists('g:started_by_firenvim') || exists('g:vscode')
  finish
endif

scriptencoding utf-8

function! StartifyEntryFormat() abort
  return 'nerdfont#find(absolute_path) .. " " .. entry_path'
endfunction

function! s:GetRecentCMakeLists() abort
  let files = filter(copy(v:oldfiles), 'v:val =~# "CMakeLists\.txt$" && v:val !~# "^file://.*"')
  return map(files, '{"line": fnamemodify(v:val, ":."), "path": v:val}')
endfunction

let g:startify_custom_header = []
let g:startify_change_cmd = 'cd'

let g:startify_lists = [
      \ { 'header': ['   Закладки'], 'type': 'bookmarks' },
      \ { 'header': ['   Последние файлы'], 'type': 'files' },
      \ { 'header': ['   CMakeLists.txt'], 'type': function('s:GetRecentCMakeLists') },
      \ { 'header': ['   Сессии'], 'type': 'sessions' },
      \ { 'header': ['   Команды'], 'type': 'commands' },
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
  let g:startify_bookmarks = [ {'c': '~/AppData/Local/nvim/init.lua'} ]
else
  let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.lua'} ]
endif

highlight link StartifyHeader String

noremap <C-n> <Cmd>SwitchToNormalBuffer<CR><Cmd>Startify<CR>
inoremap <C-n> <Esc><Cmd>SwitchToNormalBuffer<CR><Cmd>Startify<CR>
