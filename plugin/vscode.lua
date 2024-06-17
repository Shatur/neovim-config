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

vim.keymap.set('', ']c', function() vscode.call('workbench.action.editor.nextChange') end, { noremap = true })
vim.keymap.set('', '[c', function() vscode.call('workbench.action.editor.previousChange') end, { noremap = true })

vim.keymap.set('', 'ghr', function() vscode.call('git.revertSelectedRanges') end, { noremap = true })
vim.keymap.set('', 'ghs', function() vscode.call('git.stageSelectedRanges') end, { noremap = true })
vim.keymap.set('', 'ghu', function() vscode.call('git.unstageSelectedRanges') end, { noremap = true })