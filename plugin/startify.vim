scriptencoding utf-8

let g:startify_ascii = [
            \ '      .            .      ',
            \ '    .,;.           :,.    ',
            \ '  .,;;;,,.         ccc;.  ',
            \ '.;c::::,,,.        ccccc: ',
            \ '.::cc::,,,,,.      cccccc.',
            \ '.cccccc;;;;;;.     llllll.',
            \ '.cccccc.,;;;;;;.   llllll.',
            \ '.cccccc  .;;;;;;.  oooooo.',
            \ '.lllllc   .;;;;;;;.oooooo.',
            \ '.lllllc     ,::::::looooo.',
            \ '.llllll      .:::::lloddd.',
            \ '.looool       .;::coooodo.',
            \ '  .cool         .ccoooc.  ',
            \ '    .co          .:o:.    ',
            \ '      .           ..      ',
            \]
let g:startify_custom_header = 'startify#center(g:startify_ascii)'

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Закладки'] },
      \ { 'type': 'files',     'header': ['   Последние файлы'] },
      \ { 'type': 'sessions',  'header': ['   Сессии'] },
      \ { 'type': 'commands',  'header': ['   Команды'] },
      \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1

let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'} ]

noremap <C-n> :Startify<CR>
