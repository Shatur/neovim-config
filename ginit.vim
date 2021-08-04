GuiPopupmenu 0
GuiTabline 0
GuiScrollBar 1

" Context menu
nnoremap <RightMouse> <Cmd>call GuiShowContextMenu()<CR>
inoremap <RightMouse> <Cmd>call GuiShowContextMenu()<CR>
vnoremap <RightMouse> <Cmd>call GuiShowContextMenu()<CR>gv

if has('win32')
    GuiFont! CaskaydiaCove\ NF
endif
