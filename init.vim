scriptencoding utf-8

" General
set title
set lazyredraw
set linebreak
set splitright
set spelllang=en_us,ru_ru
set mouse=a
set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ " Display tabs
set fillchars=eob:\ " Do not show ~
set whichwrap+=h,l,<,>,[,] " Wrap movement between lines in edit mode
set clipboard+=unnamedplus
set pumheight=10
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Fonts
if has('win32')
  set guifont=SauceCodePro\ NF
else
  set guifont=SauceCodePro\ Nerd\ Font\ Mono
endif

" Theme
set termguicolors
colorscheme one

" For better plugins integration
set signcolumn=yes " Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
set updatetime=100 " To show git changes often
set noshowmode " Do not display current mode (use Airline for it)
set hidden " For switching between edited buffers
set shortmess+=c " Shut off completion messages

" Remap increase / decrease number shortucts to + and - signs with Alt
nnoremap <C-=> <C-a>
nnoremap <C--> <C-x>

" Movement around wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <Up> v:count ? '<Up>' : 'g<UP>'
nnoremap <expr> <Down> v:count ? '<Down>' : 'g<Down>'

" Split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Buffer / tab control
noremap <C-s> :w<CR>
noremap <C-q> :bd<CR>
noremap <A-q> :tabclose<CR>
noremap <C-x> :w<CR>:bd<CR>
noremap <A-x> :w<CR>:tabclose<CR>

" Make behavior more like in common editors
set pastetoggle=<F10>
noremap <silent> <F5> :e<CR>
noremap <C-a> gg0vG$
inoremap <C-a> <Esc>gg0vG$
inoremap <C-z> <C-o>u
inoremap <C-v> <C-g>u<F10><C-r>+<F10>
cnoremap <C-v> <C-r>+
inoremap <S-Left> <Esc>vb
inoremap <S-Right> <Esc>ve
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" Remap useless keys
nnoremap S "_diwP
vnoremap S "_dP
nnoremap Y y$
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ':'
noremap <silent> <Backspace> :b#<CR>
let mapleader = " "

" Render markdown in hover messages
let g:markdown_fenced_languages = ['help']

" Custom group for all autocmd's in configuration
augroup vimrc
  autocmd!
augroup END
