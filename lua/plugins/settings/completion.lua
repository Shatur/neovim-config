vim.g.completion_auto_change_source = true
vim.g.completion_confirm_key = ''

vim.g.completion_chain_complete_list = {
  default = {
    default = {
      { complete_items = { 'buffers' } },
      { complete_items = { 'path' }, triggered_only= { '/' } }
    }
  }
}

vim.g.completion_customize_lsp_label = {
  Function = '',
  Method = '',
  Reference = '',
  Enum = '',
  Field = 'ﰠ',
  Keyword = '',
  Variable = '',
  Folder = '',
  Snippet = '',
  Operator = '',
  Module = '',
  Text = 'ﮜ',
  Buffers = '',
  Class = '',
  Interface = ''
}

-- Use completion-nvim in every buffer
vim.cmd('autocmd vimrc BufEnter * lua require("completion").on_attach()')

-- luaeval is used because of this issue: https://github.com/neovim/neovim/issues/13862
vim.api.nvim_set_keymap('i', '<CR>', [[luaeval('require("utils.completion_autopairs").completion_confirm()')]], { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'completion#trigger_completion()', { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<Down>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('s', '<Tab>', 'pumvisible() ? "<Down>" : "<Tab>"', { expr = true })
vim.api.nvim_set_keymap('i', '<C-Tab>', 'pumvisible() ? "<Up>" : <C-Tab> ', { expr = true })
vim.api.nvim_set_keymap('s', '<C-Tab>', 'pumvisible() ? "<Up>" : <C-Tab> ', { expr = true })
