scriptencoding utf-8

set clipboard=unnamedplus

" Disable some built-in plugins
let g:loaded_netrw = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_netrwFileHandlers = v:true
let g:did_install_default_menus = v:true

" Remap useless keys
let mapleader = ' '
nnoremap Y y$
noremap <CR> :

" Move operator
noremap m d
noremap M D
nnoremap mm dd

" Remap increase / decrease number shortucts to + and - signs
nnoremap <C-=> <C-a>
nnoremap <C--> <C-x>

" .. and use <C-a> to select all
noremap <C-a> gg0vG$
vnoremap <C-a> <Esc>gg0vG$
inoremap <C-a> <Esc>gg0vG$

" Custom group for all autocmd's in configuration
augroup vimrc
  autocmd!

  " Highligh yanked text
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END

if exists('g:vscode')
  " All next settings only for Neovim
  finish
endif

" General
set title
set titlestring=%F
set lazyredraw
set linebreak
set splitright
set spelllang=en_us,ru_ru
set mouse=a
set number
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=tab:→\ " Display tabs
set fillchars=eob:\ " Do not show ~
set whichwrap+=h,l,<,>,[,] " Wrap movement between lines in edit mode
set pumheight=10
set wildmode=longest:full,full
set termguicolors

" Fonts
if has('win32')
  set guifont=SauceCodePro\ NF
else
  set guifont=SauceCodePro\ Nerd\ Font\ Mono
endif

" For better plugins integration
set signcolumn=yes " Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
set updatetime=100 " To show git changes often
set completeopt=menuone,noselect,noinsert
set noshowmode " Do not display current mode (use statusline for it)
set showtabline=2 " Always show tabline to display buffers
set hidden " For switching between edited buffers
set shortmess+=c " Shut off completion messages

" Used to prevent opening new buffers in a small buffers
command! SwitchToNormalBuffer lua require'buffers'.switch_to_normal_buffer()

" Delete buffer with saving the current layout (except special buffers)
command! BDelete lua require'buffers'.close_current_buffer()

" Delete all buffers except the current one
command! BDeleteOther lua require'buffers'.close_other_buffers()

" Movement around wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <Up> v:count ? '<Up>' : 'g<UP>'
nnoremap <expr> <Down> v:count ? '<Down>' : 'g<Down>'
inoremap <expr> <Up> pumvisible() ? '<Up>' : '<C-o>g<UP>'
inoremap <expr> <Down> pumvisible() ? '<Down>' : '<C-o>g<Down>'

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
noremap <C-q> <Cmd>BDelete<CR>
inoremap <C-q> <Esc><Cmd>BDelete<CR>
noremap <A-q> <Cmd>tabclose<CR>
inoremap <A-q> <Esc><Cmd>tabclose<CR>
noremap <C-x> <Cmd>w<CR><Cmd>BDelete<CR>
inoremap <C-x> <Esc><Cmd>w<CR><Cmd>BDelete<CR>
noremap <A-x> <Cmd>w<CR><Cmd>tabclose<CR>
inoremap <A-x> <Esc><Cmd>w<CR><Cmd>tabclose<CR>
noremap Q <Cmd>BDeleteOther<CR>
noremap <Backspace> <Cmd>buffer #<CR>

" Quickfix history navigation
noremap ]h <Cmd>cnewer<CR>
noremap [h <Cmd>colder<CR>

" Buffer navigation
noremap ]b <Cmd>SwitchToNormalBuffer<CR><Cmd>bnext<CR>
noremap [b <Cmd>SwitchToNormalBuffer<CR><Cmd>bprevious<CR>

" Git diffs
nnoremap <Leader>gl <Cmd>diffget //2<CR>
nnoremap <Leader>gh <Cmd>diffget //3<CR>

" Make behavior more like in common editors
noremap <C-s> <Cmd>w<CR>
inoremap <C-s> <Cmd>w<CR>
inoremap <C-z> <C-o>u
inoremap <C-v> <C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>
cnoremap <C-v> <C-r>+
tnoremap <C-v> <C-\><C-N>pi
inoremap <S-Left> <Esc>vb
inoremap <S-Right> <Esc>ve
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" Other
noremap <Leader>cd <Cmd>cd %:h<CR>
