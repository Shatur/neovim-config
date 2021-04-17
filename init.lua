vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = 'unnamedplus'

-- Usually installed system-wide, so disable it by the parameter
vim.g.loaded_fzf = false

-- Remap useless keys
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('n', '<CR>', ':', { noremap = true })

-- Move operator
vim.api.nvim_set_keymap('', 'm', 'd', { noremap = true })
vim.api.nvim_set_keymap('', 'M', 'D', { noremap = true })
vim.api.nvim_set_keymap('n', 'mm', 'dd', { noremap = true })

-- Remap increase / decrease number shortucts to + and - signs
vim.api.nvim_set_keymap('n', '<C-=>', '<C-a>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-->', '<C-x>', { noremap = true })

-- ..and use <C-a> to select all
vim.api.nvim_set_keymap('', '<C-a>', 'gg0vG$', { noremap = true })
vim.api.nvim_set_keymap('v', '<C-a>', '<Esc>gg0vG$', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>gg0vG$', { noremap = true })

-- Custom group for all autocmd's in configuration
vim.cmd('augroup vimrc')
vim.cmd('autocmd!')
-- Highligh yanked text
vim.cmd('autocmd TextYankPost * silent! lua vim.highlight.on_yank()')
vim.cmd('augroup END')

require('plugins')

if vim.fn.exists('g:vscode') == 1 then
  -- VSCode do not need the next settings
  return
end

-- General
vim.o.title = true
vim.o.titlestring = '%F'
vim.o.cursorline = true
vim.o.lazyredraw = true
vim.wo.linebreak = true
vim.o.splitright = true
vim.o.spelllang = 'en_us,ru_ru' 
vim.o.mouse = 'a'
vim.wo.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.cmd('set expandtab') -- https://github.com/neovim/neovim/issues/12978
vim.o.list = true
vim.o.listchars = 'space:⋅,tab:→ ' -- Display tabs
vim.o.fillchars = 'eob: ' -- Hide ~
vim.o.whichwrap = vim.o.whichwrap .. 'h,l,<,>,[,]'  -- Wrap movement between lines in edit mode
vim.o.pumheight = 10
vim.o.wildmode = 'longest:full,full' 
vim.o.termguicolors = true
vim.o.winblend = 20
vim.o.hidden = true -- For switching between edited buffers
vim.o.showmode = false -- Do not display current mode (use statusline for it)
vim.wo.signcolumn = 'yes' -- Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
vim.o.updatetime = 100 -- To show git changes often
vim.o.completeopt = 'menuone,noselect,noinsert'
vim.o.shortmess = vim.o.shortmess .. 'c' -- Shut off completion messages
vim.o.sessionoptions = vim.o.sessionoptions:gsub('help,', '')

-- Fonts
if vim.fn.has('win32') == 1 then
  vim.o.guifont = 'FiraCode NF:w57'
else
  vim.o.guifont = 'FiraCode Nerd Font Mono:l'
end

-- Movement around wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'v:count ? "j" : "gj"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', 'k', 'v:count ? "k" : "gk"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', '<Up>', 'v:count ? "<Up>" : "g<Up>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', '<Down>', 'v:count ? "<Down>" : "g<Down>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<Up>', 'pumvisible() ? "<Up>" : "<C-o>g<UP>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<Down>', 'pumvisible() ? "<Down>" : "<C-o>g<Down>"', { noremap = true, expr = true })

-- Split navigation
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

-- Quickfix history navigation
vim.api.nvim_set_keymap('', ']h', '<Cmd>cnewer<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '[h', '<Cmd>colder<CR>', { noremap = true })

-- Make behavior more like in common editors
vim.api.nvim_set_keymap('', '<C-s>', '<Cmd>w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', '<Cmd>w<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-v>', '<C-r>+', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-v>', '<C-\\><C-N>pi', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '<Esc>vb', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>ve', { noremap = true })

-- Cmdline shortcuts
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('c', '<A-b>', '<C-Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<A-f>', '<C-Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<C-\\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-l>', '<C-\\>e("")<CR>', { noremap = true })

-- Other
vim.api.nvim_set_keymap('', '<Leader>cd', '<Cmd>cd %:h<CR>', { noremap = true })

-- Tab control
vim.api.nvim_set_keymap('', '<A-q>', '<Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-q>', '<Esc><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-x>', '<Cmd>w<CR><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-x>', '<Esc><Cmd>w<CR><Cmd>tabclose<CR>', { noremap = true })

-- Contains custom scripted things
require('utils')
