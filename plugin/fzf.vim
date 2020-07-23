let g:fzf_commands_expect = 'alt-enter,ctrl-x'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Allow passing argumrnts and search only for file content
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>, 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! Spell call vimrc#fzf#Spell()
command! Packages call vimrc#fzf#Packages()

if has('win32')
  noremap <C-/> <Cmd>SwitchToNormalBuffer<CR>:Find ''<Left>
  inoremap <C-/> <Cmd>SwitchToNormalBuffer<CR>:Find ''<Left>
else
  noremap <C-_> <Cmd>SwitchToNormalBuffer<CR>:Find ''<Left>
  inoremap <C-_> <Cmd>SwitchToNormalBuffer<CR>:Find ''<Left>
endif
noremap <A-l> <Cmd>SwitchToNormalBuffer<CR><Cmd>BLines<CR>
noremap <C-p> <Cmd>SwitchToNormalBuffer<CR><Cmd>Files<CR>
noremap <A-p> <Cmd>SwitchToNormalBuffer<CR><Cmd>History<CR>
noremap <F1> <Cmd>SwitchToNormalBuffer<CR><Cmd>Helptags<CR>
noremap <Leader><Tab> <Cmd>SwitchToNormalBuffer<CR><Cmd>Buffers<CR>
noremap <S-CR> <Cmd>SwitchToNormalBuffer<CR><Cmd>Commands<CR>
nnoremap z= <Cmd>Spell<CR>
nnoremap <Leader>a <Cmd>Packages<CR>
