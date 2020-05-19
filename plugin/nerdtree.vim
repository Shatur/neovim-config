scriptencoding utf-8

let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : 'M',
    \ 'Staged'    : 'A',
    \ 'Untracked' : 'U',
    \ 'Renamed'   : 'R',
    \ 'Unmerged'  : 'U',
    \ 'Deleted'   : 'D',
    \ 'Dirty'     : '●',
    \ 'Clean'     : 'C',
    \ 'Ignored'   : 'I',
    \ 'Unknown'   : '?'
    \ }

let s:brown = '905532'
let s:aqua =  '3AFFDB'
let s:blue = '689FB6'
let s:darkBlue = '44788E'
let s:purple = '834F79'
let s:lightPurple = '834F79'
let s:red = 'AE403F'
let s:beige = 'F5C06F'
let s:yellow = 'F09F17'
let s:orange = 'D4843E'
let s:darkOrange = 'F16529'
let s:pink = 'CB6F6F'
let s:salmon = 'EE6E73'
let s:green = '8FAA54'
let s:lightGreen = '31B53E'
let s:white = 'FFFFFF'
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['gd'] = s:white
let g:NERDTreeExtensionHighlightColor['tscn'] = s:blue
let g:NERDTreeExtensionHighlightColor['material'] = s:blue
let g:NERDTreeExtensionHighlightColor['glb'] = s:green
let g:NERDTreeExtensionHighlightColor['import'] = s:white
let g:NERDTreeExtensionHighlightColor['tres'] = s:beige
let g:NERDTreeExtensionHighlightColor['godot'] = s:git_orange
let g:NERDTreeExtensionHighlightColor['cfg'] = s:purple
let g:NERDTreeExtensionHighlightColor['pck'] = s:brown
let g:NERDTreeExtensionHighlightColor['x86_64'] = s:rspec_red
let g:NERDTreeExtensionHighlightColor['otf'] = s:white

let NERDTreeMinimalUI = 1
let NERDTreeUpdateOnCursorHold = 0
let NERDTreeChDirMode = 2
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

nnoremap <silent> <A-n> :NERDTreeToggle<CR>
nnoremap <silent> <A-c> :NERDTreeFind<CR>
