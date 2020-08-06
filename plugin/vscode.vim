if !exists('g:vscode')
  finish
endif

" Usually installed system-wide, so disable it by the parameter
let g:loaded_fzf = v:false

" GTFO-like
nnoremap gof <Cmd>call VSCodeNotify('revealFileInOS')<CR>

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

" Tab control
noremap Q <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>
nnoremap <C-x> <Cmd>call VSCodeCall('workbench.action.files.save')<CR><Cmd>Tabclose<CR>

" Movement around wrapped lines
nmap <expr> j v:count ? 'j' : 'gj'
nmap <expr> k v:count ? 'k' : 'gk'
nmap <expr> <Up> v:count ? '<Up>' : 'g<UP>'
nmap <expr> <Down> v:count ? '<Down>' : 'g<Down>'

" Other
nnoremap <Leader>z <Cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>
nnoremap z= <Cmd>call VSCodeNotify('editor.action.quickFix')<CR>
