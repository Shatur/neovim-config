if vim.g.started_by_firenvim == true then
  return
end

require('toggleterm').setup({
  shell = vim.fn.has('win32') == 1 and 'powershell' or '/usr/bin/fish',
  open_mapping = '<F4>'
})
