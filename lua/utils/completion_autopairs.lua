local M = {}

function M.completion_confirm()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()['selected'] ~= -1 then
      require('completion').confirmCompletion()
      return require('nvim-autopairs').esc('<C-y>')
    else
      vim.fn.nvim_select_popupmenu_item(0 , false , false ,{})
      require('completion').confirmCompletion()
      return require('nvim-autopairs').esc('<C-n><C-y>')
    end
  else
    return require('nvim-autopairs').check_break_line_char()
  end
end

return M
