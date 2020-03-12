" Do no search in filenames, show preview in fullscreen, toggle preview with ? in normal mode
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag 
nnoremap <F1> :Helptags<CR>
nnoremap <C-;> :Commands<CR>
nnoremap <C-Tab> :Buffers<CR>

" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)
