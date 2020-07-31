if !exists('g:started_by_firenvim')
  finish
endif

set laststatus=0
set showtabline=0
packadd firenvim

let g:firenvim_config = {
      \ 'globalSettings': {
        \ 'alt': 'all',
      \  },
      \ 'localSettings': {
        \ '.*': {
          \ 'cmdline': 'firenvim',
          \ 'takeover': 'never',
          \ },
        \ }
      \ }

nnoremap <Esc><Esc> <Cmd>call firenvim#focus_page()<CR>
nnoremap <C-z> <Cmd>write<CR><Cmd>call firenvim#hide_frame()<CR>
