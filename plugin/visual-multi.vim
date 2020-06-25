autocmd vimrc User visual_multi_mappings imap <buffer><expr> <CR> pumvisible() ? '<C-Y>' : '<Plug>(VM-I-Return)'
autocmd vimrc User visual_multi_mappings nmap <buffer> p "+<Plug>(VM-p-Paste)

let g:VM_mouse_mappings = v:true
let g:VM_show_warnings = v:false
let g:VM_silent_exit = v:true
let g:VM_set_statusline = 0
let g:VM_leader = '<Space><Space>'

let g:VM_Extend_hl = 'PmenuSel'
let g:VM_Cursor_hl = 'PmenuSel'

let g:VM_maps = {}
let g:VM_maps['Increase'] = '<C-=>'
let g:VM_maps['Decrease'] = '<C-->'
let g:VM_maps['Find Subword Under'] = '<A-m>'
let g:VM_maps['Find Under'] = '<A-m>'
let g:VM_maps['Select All'] = '<A-a>'
let g:VM_maps['Start Regex Search'] = '<A-/>'
let g:VM_maps['Add Cursor At Pos'] = '<A-i>'
let g:VM_maps['Reselect Last'] = '<A-r>'
let g:VM_maps['Mouse Cursor'] = '<A-LeftMouse>'
let g:VM_maps['Mouse Word'] = '<A-RightMouse>'
let g:VM_maps['Visual All'] = '<A-a>'
