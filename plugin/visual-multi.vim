autocmd vimrc User visual_multi_mappings imap <buffer><expr> <CR> pumvisible() ? "\<C-Y>" : "\<Plug>(VM-I-Return)"

let g:VM_mouse_mappings = 1
let g:VM_show_warnings = 0
let g:VM_silent_exit = 1

let g:VM_Extend_hl = 'PmenuSel'
let g:VM_Cursor_hl = 'PmenuSel'

let g:VM_maps = {}
let g:VM_maps['Increase'] = '<C-=>'
let g:VM_maps['Decrease'] = '<C-->'
let g:VM_maps['Find Subword Under'] = '<A-m>'
let g:VM_maps['Select All'] = '<A-a>'
let g:VM_maps['Find Under'] = '<A-m>'
let g:VM_maps['Find Under'] = '<A-m>'
let g:VM_maps['Start Regex Search'] = '<A-/>'
let g:VM_maps['Add Cursor At Pos'] = '<A-i>'
let g:VM_maps['Reselect Last'] = '<A-r>'
let g:VM_maps['Mouse Cursor'] = '<A-LeftMouse>'
let g:VM_maps['Mouse Word'] = '<A-RightMouse>'
let g:VM_maps['Visual All'] = '<A-a>'
