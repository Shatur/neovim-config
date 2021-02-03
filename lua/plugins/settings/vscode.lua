vim.cmd('filetype plugin off')

-- GTFO-like
vim.api.nvim_set_keymap('n', 'gof', '<Cmd>call VSCodeNotify("revealFileInOS")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'got', '<Cmd>call VSCodeNotify("workbench.action.terminal.openNativeConsole")<CR>', { noremap = true })

-- Open-browser-like
vim.api.nvim_set_keymap('n', 'gx', '<Cmd>call VSCodeNotify("editor.action.openLink")<CR>', { noremap = true })

-- Unimpaired-like, treat VSCode tabs like buffers
vim.api.nvim_set_keymap('n', ']b', '<Cmd>Tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[b', '<Cmd>Tabprevious<CR>', { noremap = true })

-- Commentary-like
vim.api.nvim_set_keymap('x', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('n', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('o', 'gc', '<Plug>VSCodeCommentary', {})
vim.api.nvim_set_keymap('n', 'gcc', '<Plug>VSCodeCommentaryLine', {})

-- GitGutter-like
vim.api.nvim_set_keymap('n', ']c', '<Cmd>call VSCodeNotify("workbench.action.editor.nextChange")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[c', '<Cmd>call VSCodeNotify("workbench.action.editor.previousChange")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hs', '<Cmd>call VSCodeNotify("git.stageSelectedRanges")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hu', '<Cmd>call VSCodeNotify("git.unstageSelectedRanges")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>hr', '<Cmd>call VSCodeNotify("git.revertSelectedRanges")<CR>', { noremap = true })

-- Fugitive-like
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Cmd>call VSCodeNotify("git.openChange")<CR>', { noremap = true })

-- Visual-Multi-like
vim.api.nvim_set_keymap('n', '<A-m>', 'i<Cmd>call VSCodeNotify("editor.action.addSelectionToNextFindMatch")<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<A-m>', '<Esc>i<Cmd>lua require("utils.vscode").command_on_last_selection("editor.action.addSelectionToNextFindMatch")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Down>', 'i<Cmd>call VSCodeNotify("editor.action.insertCursorBelow")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-Up>', 'i<Cmd>call VSCodeNotify("editor.action.insertCursorAbove")<CR>', { noremap = true })

-- Diagnostic jumping
vim.api.nvim_set_keymap('n', '[w', '<Cmd>call VSCodeNotify("editor.action.marker.prev")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ']w', '<Cmd>call VSCodeNotify("editor.action.marker.next")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '[W', '<Cmd>call VSCodeNotify("editor.action.marker.prevInFiles")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', ']W', '<Cmd>call VSCodeNotify("editor.action.marker.nextInFiles")<CR>', { noremap = true })

-- Tab control
vim.api.nvim_set_keymap('', 'Q', '<Cmd>call VSCodeNotify("workbench.action.closeOtherEditors")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-x>', '<Cmd>call VSCodeCall("workbench.action.files.save")<CR><Cmd>Tabclose<CR>', { noremap = true })

-- Use == for reindent instead of LSP formatting
vim.api.nvim_set_keymap('n', '==', '<Cmd>call VSCodeNotify("editor.action.reindentselectedlines")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<A-=>', '<Cmd>call VSCodeNotify("editor.action.formatSelection")<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '=', '<Cmd>lua require("utils.vscode").visual_mode_command("editor.action.reindentselectedlines")<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<A-=>', '<Cmd>lua require("utils.vscode").visual_mode_command("editor.action.formatSelection")<CR>', { noremap = true })

-- LSP
vim.api.nvim_set_keymap('', 'gh', 'i<Cmd>call VSCodeNotify("references-view.find")<CR>', { noremap = true })
vim.api.nvim_set_keymap('', 'gs', '<Cmd>call VSCodeNotify("workbench.action.showAllSymbols")<CR>', { noremap = true })

-- Movement around wrapped lines 
vim.api.nvim_set_keymap('n', 'j', 'gj', {})
vim.api.nvim_set_keymap('n', 'k', 'gk', {})
  
-- Unmap default multicursors command to use m for move
vim.api.nvim_del_keymap('x', 'ma')
vim.api.nvim_del_keymap('x', 'mi')
vim.api.nvim_del_keymap('x', 'mA')
vim.api.nvim_del_keymap('x', 'mI')

-- Other
vim.api.nvim_set_keymap('n', '<Leader>z', '<Cmd>call VSCodeNotify("workbench.action.toggleZenMode")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'z=', '<Cmd>call VSCodeNotify("editor.action.quickFix")<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-_>', 'i<Cmd>call VSCodeNotify("actions.find")<CR>', { noremap = true })
