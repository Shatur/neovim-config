let g:VM_mouse_mappings = 1

let g:VM_maps = {}
let g:VM_maps['Increase'] = '<A-=>'
let g:VM_maps['Decrease'] = '<A-->' 
let g:VM_maps['Find Under'] = '<A-m>'

autocmd User visual_multi_mappings  imap <buffer><expr> <CR> pumvisible() ? "\<C-Y>" : "\<Plug>(VM-I-Return)"
