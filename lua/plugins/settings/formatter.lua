require('formatter').setup({
  filetype = {
    lua = {
      function()
        return {exe = 'lua-format'}
      end
    },
    markdown = {
      function()
        return {exe = 'prettier'}
      end
    },
    cpp = {
      function()
        return {exe = 'clang-format'}
      end
    }
  }
})
