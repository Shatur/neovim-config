" Do no search in filenames, show preview in fullscreen, toggle preview with ? in normal mode
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag 
