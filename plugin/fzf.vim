" Allow passing argumrnts and search only for file content
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case ' . <q-args>, 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

command! Spell call vimrc#fzf#Spell()

let g:fzf_commands_expect = 'alt-enter,ctrl-x'

nnoremap <C-f> :Find<Space>
nnoremap <A-l> <Cmd>BLines<CR>
nnoremap <C-p> <Cmd>Files<CR>
nnoremap <A-p> <Cmd>History<CR>
nnoremap <F1> <Cmd>Helptags<CR>
nnoremap <Leader><Tab> <Cmd>Buffers<CR>
nnoremap <S-CR> <Cmd>Commands<CR>
nnoremap z= <Cmd>Spell<CR>
