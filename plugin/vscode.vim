if !exists('g:vscode')
  finish
endif

filetype plugin off

" Usually installed system-wide, so disable it by the parameter
let g:loaded_fzf = v:false

" GTFO-like
nnoremap gof <Cmd>call VSCodeNotify('revealFileInOS')<CR>
nnoremap got <Cmd>call VSCodeNotify('workbench.action.terminal.openNativeConsole')<CR>

" Unimpaired-like, treat VSCode tabs like buffers
nnoremap ]b <Cmd>Tabnext<CR>
nnoremap [b <Cmd>Tabprevious<CR>

" Commentary-like
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" GitGutter-like
nnoremap ]c <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
nnoremap <Leader>hs <Cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>
nnoremap <Leader>hu <Cmd>call VSCodeNotify('git.unstageSelectedRanges')<CR>
nnoremap <Leader>hr <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>

" Fugitive-like
nnoremap <Leader>gl <Cmd>call VSCodeNotify('git-graph.view')<CR>
nnoremap <Leader>gp <Cmd>call VSCodeNotify('git.push')<CR>
nnoremap <Leader>gP <Cmd>call VSCodeNotify('git.pullRebase')<CR>
nnoremap <Leader>gd <Cmd>call VSCodeNotify('git.openChange')<CR>

" Visual-Multi like
nnoremap <A-m> i<Cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>
vnoremap <A-m> <Esc>i<Cmd>call vimrc#vscode#CommandOnLastLesection('editor.action.addSelectionToNextFindMatch')<CR>

" Tab control
noremap Q <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
nnoremap <C-x> <Cmd>call VSCodeCall('workbench.action.files.save')<CR><Cmd>Tabclose<CR>

" Formatting
nmap <A-i> <Cmd>call VSCodeNotify('editor.action.formatSelection')<CR>
xmap <A-i> <Cmd>call vimrc#vscode#VisualModeCommand('editor.action.formatSelection')<CR>
nnoremap == <Cmd>call VSCodeNotify('editor.action.reindentselectedlines')<CR>
xnoremap = <Cmd>call vimrc#vscode#VisualModeCommand('editor.action.reindentselectedlines')<CR>

" Movement around wrapped lines
nmap j gj
nmap k gk

" Remap default multicursors command to use m for move
xunmap ma
xunmap mi
xunmap mA
xunmap mI

" Other
nnoremap <Leader>z <Cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>
nnoremap z= <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
