-- General
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = 'unnamedplus'
vim.o.title = true
vim.o.titlestring = '%F'
vim.o.cursorline = true
vim.o.lazyredraw = true
vim.o.linebreak = true
vim.o.splitright = true
vim.o.spelllang = 'en_us,ru_ru'
vim.o.mouse = 'a'
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.list = true
vim.o.listchars = 'space:·,trail:·,tab:→ '
vim.o.fillchars = 'diff:╱,eob: ' -- Create a nice diff and hide ~
vim.o.whichwrap = vim.o.whichwrap .. 'h,l,<,>,[,]' -- Wrap movement between lines in edit mode
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.wildmode = 'longest:full,full'
vim.o.termguicolors = true
vim.o.foldenable = false
vim.o.swapfile = false
vim.o.showmode = false -- Do not display current mode (use statusline for it)
vim.o.signcolumn = 'yes' -- Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
vim.o.updatetime = 100 -- To show git changes often
vim.o.shortmess = vim.o.shortmess .. 'c' -- Shut off completion messages
vim.o.formatoptions = vim.bo.formatoptions:gsub('cro', '')

if vim.fn.has('unix') == 1 then
  vim.o.guifont = 'FiraCode Nerd Font Mono' -- Fonts on Windows set in ginit to avoid metrics error in Neovim Qt
  vim.o.shell = '/usr/bin/bash' -- I use fish on Linux and it slow for running internal commands
end

-- Disable built-in matchparen plugin (use faster lua implementation)
vim.g.loaded_matchparen = false

-- Disable default keybindings <C-a> and <C-x> for interactive rebase
vim.g.no_gitrebase_maps = false

-- Remap useless keys
vim.g.mapleader = ' '
vim.keymap.set({ 'n', 'v' }, '<CR>', ':', { noremap = true })

-- Remap increase / decrease number shortucts to + and - signs
vim.keymap.set('n', '<C-=>', '<C-a>', { noremap = true })
vim.keymap.set('n', '<C-->', '<C-x>', { noremap = true })

-- ..and use <C-a> to select all
vim.keymap.set('', '<C-a>', 'gg0vG$', { noremap = true })
vim.keymap.set({ 'v', 'i' }, '<C-a>', '<Esc>gg0vG$', { noremap = true })

-- Movement around wrapped lines
vim.keymap.set('n', 'j', 'v:count ? "j" : "gj"', { noremap = true, expr = true })
vim.keymap.set('n', 'k', 'v:count ? "k" : "gk"', { noremap = true, expr = true })
vim.keymap.set('n', '<Up>', 'v:count ? "<Up>" : "g<Up>"', { noremap = true, expr = true })
vim.keymap.set('n', '<Down>', 'v:count ? "<Down>" : "g<Down>"', { noremap = true, expr = true })
vim.keymap.set('i', '<Up>', 'pumvisible() ? "<Up>" : "<C-o>g<UP>"', { noremap = true, expr = true })
vim.keymap.set('i', '<Down>', 'pumvisible() ? "<Down>" : "<C-o>g<Down>"', { noremap = true, expr = true })

-- Split navigation
vim.keymap.set({ 't', 'i' }, '<C-h>', '<C-\\><C-N><C-w>h', { noremap = true })
vim.keymap.set({ 't', 'i' }, '<C-j>', '<C-\\><C-N><C-w>j', { noremap = true })
vim.keymap.set({ 't', 'i' }, '<C-k>', '<C-\\><C-N><C-w>k', { noremap = true })
vim.keymap.set({ 't', 'i' }, '<C-l>', '<C-\\><C-N><C-w>l', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Quickfix history navigation
vim.keymap.set('', ']h', '<Cmd>cnewer<CR>', { noremap = true })
vim.keymap.set('', '[h', '<Cmd>colder<CR>', { noremap = true })

-- Make behavior more like in common editors
vim.keymap.set({ '', 'i' }, '<C-s>', '<Cmd>write<CR>', { noremap = true })
vim.keymap.set('i', '<C-z>', '<C-o>u', { noremap = true })
vim.keymap.set('i', '<C-v>', '<C-g>u<Cmd>set paste<CR><C-r>+<Cmd>set nopaste<CR>', { noremap = true })
vim.keymap.set('c', '<C-v>', '<C-r>+', { noremap = true })
vim.keymap.set('t', '<C-v>', '<C-\\><C-N>pi', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.keymap.set('i', '<S-Left>', '<Esc>vb', { noremap = true })
vim.keymap.set('i', '<S-Right>', '<Esc>ve', { noremap = true })

-- Move lines
vim.keymap.set('n', '<A-j>', '<Cmd>move+1<CR>==', { noremap = true })
vim.keymap.set('n', '<A-k>', '<Cmd>move-2<CR>==', { noremap = true })
vim.keymap.set('i', '<A-j>', '<Esc><Cmd>move+1<CR>==gi', { noremap = true })
vim.keymap.set('i', '<A-k>', '<Esc><Cmd>move-2<CR>==gi', { noremap = true })
vim.keymap.set('v', '<A-j>', "<Esc><Cmd>'<,'>move'>+1<CR>gv=gv", { noremap = true })
vim.keymap.set('v', '<A-k>', "<Esc><Cmd>'<,'>move'<-2<CR>gv=gv", { noremap = true })

-- Cmdline shortcuts
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true })
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true })
vim.keymap.set('c', '<A-b>', '<C-Left>', { noremap = true })
vim.keymap.set('c', '<A-f>', '<C-Right>', { noremap = true })
vim.keymap.set('c', '<C-k>', '<C-\\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>', { noremap = true })
vim.keymap.set('c', '<C-l>', '<C-\\>e("")<CR>', { noremap = true })

-- Do not exit visual mode on shift
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- Change directory into the current file folder
vim.keymap.set('', '<Leader>cd', '<Cmd>cd %:h<CR>', { noremap = true })

-- Back to the previous buffer
vim.keymap.set('', '<Backspace>', '<Cmd>buffer #<CR>', { noremap = true })

-- Tab control
vim.keymap.set('', '<A-q>', '<Cmd>tabclose<CR>', { noremap = true })
vim.keymap.set({ 'i', 't' }, '<A-q>', '<Esc><Cmd>tabclose<CR>', { noremap = true })
vim.keymap.set('', '<A-x>', '<Cmd>write<CR><Cmd>tabclose<CR>', { noremap = true })
vim.keymap.set('i', '<A-x>', '<Esc><Cmd>write<CR><Cmd>tabclose<CR>', { noremap = true })
vim.keymap.set('', ']t', '<Cmd>tabnext<CR>', { noremap = true })
vim.keymap.set('', '[t', '<Cmd>tabprevious<CR>', { noremap = true })

-- Autocommands
local config_group = vim.api.nvim_create_augroup('Config', {})
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = config_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_create_autocmd({ 'BufAdd' }, {
  pattern = 'fugitive://*',
  group = config_group,
  callback = function()
    if vim.wo.diff then
      vim.wo.winhighlight = 'DiffAdd:DiffDelete'
    end
  end,
})
