scriptencoding utf-8

" General
set title
set lazyredraw
set linebreak
set splitright
set spelllang=en_us,ru_ru
set mouse=a
set number relativenumber
set ignorecase smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ " Display tabs
set fillchars=eob:\ " Do not show ~
set whichwrap+=h,l,<,>,[,] " Wrap movement between lines in edit mode
set clipboard=unnamedplus
set pumheight=10
set wildmode=longest:full,full

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
set completeopt=menuone,noselect,noinsert
set noshowmode " Do not display current mode (use Airline for it)
set hidden " For switching between edited buffers
set shortmess+=c " Shut off completion messages
let loaded_netrwPlugin = v:false " Do not load built-in netrw

" Remap increase / decrease number shortucts to + and - signs with Alt
nnoremap <C-=> <C-a>
nnoremap <C--> <C-x>

" Movement around wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <Up> v:count ? '<Up>' : 'g<UP>'
nnoremap <expr> <Down> v:count ? '<Down>' : 'g<Down>'

" Split navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer / tab control
noremap <silent> <C-q> :bd<CR>
vnoremap <silent> <C-q> :bd<CR>
inoremap <silent> <C-q> <Esc>:bd<CR>
noremap <silent> <A-q> :tabclose<CR>
vnoremap <silent> <A-q> :tabclose<CR>
inoremap <silent> <A-q> <Esc>:tabclose<CR>
noremap <silent> <C-x> :w<CR>:bd<CR>
vnoremap <silent> <C-x> :w<CR>:bd<CR>
inoremap <silent> <C-x> <Esc>:w<CR>:bd<CR>
noremap <silent> <A-x> :w<CR>:tabclose<CR>
vnoremap <silent> <A-x> :w<CR>:tabclose<CR>
inoremap <silent> <A-x> <Esc>:w<CR>:tabclose<CR>

" Make behavior more like in common editors
set pastetoggle=<F10>
noremap <silent> <C-s> :w<CR>
vnoremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <C-o>:w<CR>
noremap <C-a> gg0vG$
vnoremap <C-a> <Esc>gg0vG$
inoremap <C-a> <Esc>gg0vG$
inoremap <C-z> <C-o>u
inoremap <C-v> <C-g>u<F10><C-r>+<F10>
cnoremap <C-v> <C-r>+
tnoremap <C-v> <C-\><C-N>pi
inoremap <S-Left> <Esc>vb
inoremap <S-Right> <Esc>ve
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" Remap useless keys
nnoremap Y y$
nnoremap <CR> :
vnoremap <CR> :
noremap <silent> <Backspace> :b#<CR>
let mapleader = ' '

" Custom group for all autocmd's in configuration
augroup vimrc
  autocmd!
augroup END
