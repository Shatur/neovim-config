local M = {}

function M.command_on_last_selection(command)
    if vim.fn.visualmode() == 'V' then
        vim.fn.VSCodeNotifyRange(command, vim.fn.line("'<"), vim.fn.line("'>"), 1)
    else
        local startPos = vim.fn.getpos("'<")
        local endPos = vim.fn.getpos("'>")
        vim.fn.VSCodeNotifyRangePos(command, startPos[2], endPos[2], startPos[3], endPos[3] + 1, 1)
    end
end

function M.visual_mode_command(command)
  if vim.fn.mode() == 'V' then
    local startLine = vim.fn.line('v')
    local endLine = vim.fn.line('.')
    vim.fn.VSCodeNotifyRange(command, startLine, endLine, 1)
  else
    local startPos = vim.fn.getpos('v')
    local endPos = vim.fn.getpos('.')
    vim.fn.VSCodeNotifyRangePos(command, startPos[2], endPos[2], startPos[3], endPos[3] + 1, 0)
  end
end

return M
