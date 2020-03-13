scriptencoding utf-8

" General
set title
set lazyredraw
set linebreak
set spelllang=en_us,ru_ru
set mouse=a
set number relativenumber
set guifont=SauceCodePro\ Nerd\ Font\ Mono
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ " Display tabs
set fillchars=eob:\ " Do not show ~
set whichwrap+=h,l,<,>,[,] " Wrap movement between lines in edit mode
set clipboard+=unnamedplus
set pumheight=10

" Theme
set termguicolors
colorscheme one

" For better plugins integration
set signcolumn=yes " Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
set updatetime=100 " To show git changes often
set noshowmode " Do not display current mode (use Airline for it)
set hidden " For switching between edited buffers
set completeopt-=preview " Disable embedded preview
set completeopt+=menuone,noinsert " Autocomplete
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

" Saving
nnoremap <Leader>w <C-w>
noremap <C-w> :w<CR>
noremap <C-q> :bd<CR>
noremap <C-x> :w<CR>:bd<CR>

" Make behavior more like in common editors
set pastetoggle=<F10>
noremap <F5> :e<CR>
noremap <C-a> gg0vG$
inoremap <C-a> <Esc>gg0vG$
inoremap <C-z> <C-o>u
inoremap <C-v> <C-g>u<F10><C-r>+<F10>
cnoremap <C-v> <C-r>+
inoremap <S-Left> <Esc>vb
inoremap <S-Right> <Esc>ve

" Custom group for all autocmd's in configuration
augroup vimrc
  autocmd!
augroup END
