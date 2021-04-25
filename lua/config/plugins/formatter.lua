require('formatter').setup({
  filetype = {
    lua = {
      function()
        return {exe = 'lua-format'}
      end
    },
    markdown = {
      function()
        return {
          exe = 'prettier',
          args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0)}
        }
      end
    },
    cpp = {
      function()
        return {exe = 'clang-format'}
      end
    }
  }
})
