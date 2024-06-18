if not vim.g.vscode then
  return
end

local vscode = require('vscode')

vim.keymap.set('', ']b', function() vscode.call('workbench.action.nextEditorInGroup') end, { noremap = true })
vim.keymap.set('', '[b', function() vscode.call('workbench.action.previousEditorInGroup') end, { noremap = true })
vim.keymap.set('', '[B', function() vscode.call('workbench.action.firstEditorInGroup') end, { noremap = true })
vim.keymap.set('', ']B', function() vscode.call('workbench.action.lastEditorInGroup') end, { noremap = true })

vim.keymap.set('', ']t', function() vscode.call('workbench.action.nextEditorGroup') end, { noremap = true })
vim.keymap.set('', '[t', function() vscode.call('workbench.action.previousEditorGroup') end, { noremap = true })

vim.keymap.set('', ']d', function() vscode.call('editor.action.marker.next') end, { noremap = true })
vim.keymap.set('', '[d', function() vscode.call('editor.action.marker.prev') end, { noremap = true })
vim.keymap.set('', ']D', function() vscode.call('editor.action.marker.nextInFiles') end, { noremap = true })
vim.keymap.set('', '[D', function() vscode.call('editor.action.marker.nextInFiles') end, { noremap = true })

vim.keymap.set('', ']c', function() vscode.call('workbench.action.editor.nextChange') end, { noremap = true })
vim.keymap.set('', '[c', function() vscode.call('workbench.action.editor.previousChange') end, { noremap = true })
vim.keymap.set('', ']C', function() vscode.call('editor.action.dirtydiff.next') end, { noremap = true })
vim.keymap.set('', '[C', function() vscode.call('editor.action.dirtydiff.previous') end, { noremap = true })

vim.keymap.set('', '<Leader>hr', function() vscode.call('git.revertSelectedRanges') end, { noremap = true })
vim.keymap.set('', '<Leader>hs', function() vscode.call('git.stageSelectedRanges') end, { noremap = true })
vim.keymap.set('', '<Leader>hu', function() vscode.call('git.unstageSelectedRanges') end, { noremap = true })

vim.keymap.set('', '<C-w>q', function() vscode.call('workbench.action.closeEditorsAndGroup') end, { noremap = true })
vim.keymap.set('', '<C-w>O', function() vscode.call('workbench.action.closeOtherEditors') end, { noremap = true })
