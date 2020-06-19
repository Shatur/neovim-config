" Allow passing argumrnts and search only for file content
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>, 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! Spell call vimrc#fzf#Spell()

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

noremap <C-f> :Find ''<Left>
noremap <A-l> <Cmd>BLines<CR>
noremap <C-p> <Cmd>Files<CR>
noremap <A-p> <Cmd>History<CR>
noremap <F1> <Cmd>Helptags<CR>
noremap <Leader><Tab> <Cmd>Buffers<CR>
noremap <S-CR> <Cmd>Commands<CR>
nnoremap z= <Cmd>Spell<CR>
