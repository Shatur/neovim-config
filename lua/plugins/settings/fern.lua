vim.g['fern#renderer'] = 'nerdfont'
vim.g['fern#disable_default_mappings'] = true

vim.api.nvim_set_keymap('', '<A-f>', '<Cmd>execute "Fern " .. fnameescape(asyncrun#get_root("%")) .. " -reveal=" .. expand("%:p") .. " -drawer -toggle -keep"<CR>', { noremap = true })
