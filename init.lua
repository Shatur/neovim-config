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
vim.o.listchars = 'space:⋅,tab:→ ' -- Display tabs
vim.o.fillchars = 'eob: ' -- Hide ~
vim.o.whichwrap = vim.o.whichwrap .. 'h,l,<,>,[,]' -- Wrap movement between lines in edit mode
vim.o.pumheight = 10
vim.o.wildmode = 'longest:full,full'
vim.o.termguicolors = true
vim.o.foldenable = false
vim.o.swapfile = false
vim.o.hidden = true -- For switching between edited buffers
vim.o.showmode = false -- Do not display current mode (use statusline for it)
vim.o.signcolumn = 'yes' -- Always show the signcolum, otherwise it would shift the text each time changes appear/disappear
vim.o.updatetime = 100 -- To show git changes often
vim.o.shortmess = vim.o.shortmess .. 'c' -- Shut off completion messages
vim.o.formatoptions = vim.bo.formatoptions:gsub('cro', '')

if vim.fn.has('unix') == 1 then
  vim.o.shell = '/usr/bin/bash' -- I use fish on Linux and it slow for running internal commands
end

-- Fonts on Windows set in ginit to avoid metrics error in Neovim Qt
if vim.fn.has('win32') == 0 then
  vim.o.guifont = 'FiraCode Nerd Font Mono'
end

-- Set background depending on time
local hours = tonumber(os.date('%H'))
if hours >= 9 and hours <= 17 then
  vim.o.background = 'light'
end

-- Disable default keybindings <C-a> and <C-x> for interactive rebase
vim.g.no_gitrebase_maps = false

-- Open folder in system explorer
vim.api.nvim_command('command! -complete=dir -nargs=* Explorer lua require("config_utils.gtfo").open_explorer(vim.fn.expand("<args>"))')

-- Open folder in system terminal
vim.api.nvim_command('command! -complete=dir -nargs=* Terminal lua require("config_utils.gtfo").open_terminal(vim.fn.expand("<args>"))')

-- Delete buffer with saving the current layout (except special buffers)
vim.api.nvim_command('command! -nargs=? -bang BDelete lua require("config_utils.buffers").close_current_buffer(<q-args>, <q-bang>)')

-- Update all plugins and commit changes
vim.api.nvim_command('command! -nargs=? UpdatePlugins lua require("config_utils.updater").update_plugins(<args>)')

-- Pull latest configuration changes from repo
vim.api.nvim_command('command! UpdateConfig lua require("config_utils.updater").update_config()')

-- Start debugging
vim.api.nvim_command('command! -complete=file -nargs=+ Lldb lua require("config_utils.debug").lldb(<f-args>)')

-- Toggle diagnostics
vim.api.nvim_command('command! LspToggleDiagnostics lua require("config_utils.diagnostics").toggle_diagnostics()')

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
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '<Esc>vb', { noremap = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<Esc>ve', { noremap = true })

-- Move lines
vim.api.nvim_set_keymap('n', '<A-j>', '<Cmd>move+1<CR>==', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<Cmd>move-2<CR>==', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc><Cmd>move+1<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc><Cmd>move-2<CR>==gi', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-j>', "<Esc><Cmd>'<,'>move'>+1<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', '<A-k>', "<Esc><Cmd>'<,'>move'<-2<CR>gv=gv", { noremap = true })

-- Cmdline shortcuts
vim.api.nvim_set_keymap('c', '<C-a>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-e>', '<End>', { noremap = true })
vim.api.nvim_set_keymap('c', '<A-b>', '<C-Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<A-f>', '<C-Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-k>', '<C-\\>e(strpart(getcmdline(), 0, getcmdpos() - 1))<CR>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-l>', '<C-\\>e("")<CR>', { noremap = true })

-- Other
vim.api.nvim_set_keymap('', '<Leader>cd', '<Cmd>cd %:h<CR>', { noremap = true })

-- Buffers control
vim.api.nvim_set_keymap('', '<C-q>', '<Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-q>', '<Esc><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<C-q>', '<Esc><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<C-x>', '<Cmd>w<CR><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc><Cmd>w<CR><Cmd>BDelete<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Backspace>', '<Cmd>buffer #<CR>', { noremap = true })

-- Tab control
vim.api.nvim_set_keymap('', '<A-q>', '<Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-q>', '<Esc><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<A-q>', '<Esc><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-x>', '<Cmd>w<CR><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<A-x>', '<Esc><Cmd>w<CR><Cmd>tabclose<CR>', { noremap = true })
vim.api.nvim_set_keymap('', ']t', '<Cmd>tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '[t', '<Cmd>tabnext<CR>', { noremap = true })

-- Open current file folder
vim.api.nvim_set_keymap('', 'got', '<Cmd>lua require("config_utils.gtfo").open_terminal(vim.fn.expand("%:h"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'goT', '<Cmd>lua require("config_utils.gtfo").open_terminal()<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'gof', '<Cmd>lua require("config_utils.gtfo").open_explorer(vim.fn.expand("%:h"))<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'goF', '<Cmd>lua require("config_utils.gtfo").open_explorer()<CR>', { noremap = true })

-- Highlight yanked text
vim.cmd([[
augroup hi_on_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup END
]])
