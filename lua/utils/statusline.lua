local mode = require('lualine.utils.mode')
local statusline = {}

-- Check for visual-multi mode
function statusline.mode()
  local vm_selection = vim.b.VM_Selection
  if vm_selection and vim.fn.empty(vim.b.VM_Selection) ~= 1 then
    return 'MULTI CURSORS'
  end
  return mode.get_mode()
end

-- Show current cursor number and cursors count
function statusline.cursors()
  local vm_info = vim.fn.VMInfos()
  if vim.tbl_isempty(vm_info) then
    return ''
  end
  return vm_info['current'] .. '/' .. vm_info['total'] .. ' '
end

return statusline
