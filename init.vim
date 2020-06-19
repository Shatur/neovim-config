scriptencoding utf-8

" General
set title
set lazyredraw
set linebreak
set splitright
set spelllang=en_us,ru_ru
set mouse=a
set number
set relativenumber
set ignorecase
set smartcase
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

" Remap useless keys
let mapleader = ' '
nnoremap Y y$
noremap <CR> :
noremap <Backspace> <Cmd>b#<CR>

" Remap increase / decrease number shortucts to + and - signs
nnoremap <C-=> <C-a>
nnoremap <C--> <C-x>

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
noremap <C-q> <Cmd>bd<CR>
vnoremap <C-q> <Cmd>bd<CR>
inoremap <C-q> <Esc><Cmd>bd<CR>
noremap <A-q> <Cmd>tabclose<CR>
vnoremap <A-q> <Cmd>tabclose<CR>
inoremap <A-q> <Esc><Cmd>tabclose<CR>
noremap <C-x> <Cmd>w<CR><Cmd>bd<CR>
vnoremap <C-x> <Cmd>w<CR><Cmd>bd<CR>
inoremap <C-x> <Esc><Cmd>w<CR><Cmd>bd<CR>
noremap <A-x> <Cmd>w<CR><Cmd>tabclose<CR>
vnoremap <A-x> <Cmd>w<CR><Cmd>tabclose<CR>
inoremap <A-x> <Esc><Cmd>w<CR><Cmd>tabclose<CR>

" Tabs navigation
noremap ]<Tab> <Cmd>tabnext<CR>
vnoremap ]<Tab> <Cmd>tabnext<CR>
noremap [<Tab> <Cmd>tabprevious<CR>
vnoremap [<Tab> <Cmd>tabprevious<CR>

" Quickfix history navigation
noremap ]h <Cmd>cnewer<CR>
vnoremap ]h <Cmd>cnewer<CR>
noremap [h <Cmd>colder<CR>
vnoremap [h <Cmd>colder<CR>

" Make behavior more like in common editors
set pastetoggle=<F10>
noremap <C-s> <Cmd>w<CR>
vnoremap <C-s> <Cmd>w<CR>
inoremap <C-s> <Cmd>w<CR>
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

" Other useful shortucts
noremap <Leader>cd <Cmd>cd %:h<CR>

" Disable netrw
let g:loaded_netrw = v:true
let g:loaded_netrwPlugin = v:true
let g:loaded_netrwSettings = v:true
let g:loaded_netrwFileHandlers = v:true

" Setup built-in LSP client
packadd nvim-lsp
lua require'lsp_config'
sign define LspDiagnosticsErrorSign text=
sign define LspDiagnosticsWarningSign text=
sign define LspDiagnosticsInformationSign text=
sign define LspDiagnosticsHintSign text=

" Custom group for all autocmd's in configuration
augroup vimrc
  autocmd!

  " Highligh yanked text
  autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank("IncSearch", 300)
augroup END
