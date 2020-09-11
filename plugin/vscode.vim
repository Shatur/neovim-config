if !exists('g:vscode')
  finish
endif

filetype plugin off

" Usually installed system-wide, so disable it by the parameter
let g:loaded_fzf = v:false

" GTFO-like
nnoremap gof <Cmd>call VSCodeNotify('revealFileInOS')<CR>
nnoremap got <Cmd>call VSCodeNotify('workbench.action.terminal.openNativeConsole')<CR>

" Open-browser-like
nnoremap gx <Cmd>call VSCodeNotify('editor.action.openLink')<CR>

" Unimpaired-like, treat VSCode tabs like buffers
nnoremap ]b <Cmd>Tabnext<CR>
nnoremap [b <Cmd>Tabprevious<CR>

" Commentary-like
xmap gc <Plug>VSCodeCommentary
nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" GitGutter-like
nnoremap ]c <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
nnoremap ghs <Cmd>call VSCodeNotify('git.stageSelectedRanges')<CR>
nnoremap ghu <Cmd>call VSCodeNotify('git.unstageSelectedRanges')<CR>
nnoremap ghr <Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>

" Fugitive-like
nnoremap <Leader>gp <Cmd>call VSCodeNotify('git.push')<CR>
nnoremap <Leader>gP <Cmd>call VSCodeNotify('git.pullRebase')<CR>
nnoremap <Leader>gd <Cmd>call VSCodeNotify('git.openChange')<CR>

" Visual-Multi-like
nnoremap <A-m> i<Cmd>call VSCodeNotify('editor.action.addSelectionToNextFindMatch')<CR>
vnoremap <A-m> <Esc>i<Cmd>lua require'vscode'.command_on_last_selection('editor.action.addSelectionToNextFindMatch')<CR>
nnoremap <C-Down> i<Cmd>call VSCodeNotify('editor.action.insertCursorBelow')<CR>
nnoremap <C-Up> i<Cmd>call VSCodeNotify('editor.action.insertCursorAbove')<CR>

" Tab control
noremap Q <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
nnoremap <C-x> <Cmd>call VSCodeCall('workbench.action.files.save')<CR><Cmd>Tabclose<CR>

" Formatting
xmap <A-i> <Cmd>lua require'vscode'.visual_mode_command('editor.action.formatSelection')<CR>
nnoremap == <Cmd>call VSCodeNotify('editor.action.reindentselectedlines')<CR>
xnoremap = <Cmd>lua require'vscode'.visual_mode_command('editor.action.reindentselectedlines')<CR>

" Use built-in search engine
" Open insert mode to handle it correctly
noremap / i<Cmd>call VSCodeNotify('actions.find')<CR>
noremap ? i<Cmd>call VSCodeNotify('actions.find')<CR>
nnoremap * i<Cmd>call VSCodeNotify('editor.action.nextMatchFindAction')<CR><Cmd>call VSCodeNotify('actions.find')<CR>
xnoremap * <Esc>i<Cmd>lua require'vscode'.command_on_last_selection('editor.action.nextMatchFindAction')<CR><Cmd>call VSCodeNotify('actions.find')<CR>
nnoremap n i<Cmd>call VSCodeNotify('editor.action.nextMatchFindAction')<CR><Cmd>call VSCodeNotify('actions.find')<CR>
nnoremap N i<Cmd>call VSCodeNotify('editor.action.previousMatchFindAction')<CR><Cmd>call VSCodeNotify('actions.find')<CR>

" LSP
noremap gf i<Cmd>call VSCodeNotify('references-view.find')<CR>
noremap gs <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>

" Movement around wrapped lines
nmap j gj
nmap k gk

" Unmap default multicursors command to use m for move
xunmap ma
xunmap mi
xunmap mA
xunmap mI

" Other
nnoremap <Leader>z <Cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>
nnoremap z= <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
