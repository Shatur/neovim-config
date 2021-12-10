local function stylua()
  return {
    exe = 'stylua',
    args = { '--search-parent-directories', '-' },
    stdin = true,
  }
end

local function prettier()
  return {
    exe = 'prettier',
    args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0) },
    stdin = true,
  }
end

local function clang_format()
  return {
    exe = 'clang-format',
    args = { '--assume-filename', vim.api.nvim_buf_get_name(0) },
    stdin = true,
    cwd = vim.fn.expand('%:p:h'), -- Run clang-format in cwd of the file.
  }
end

local function rustfmt()
  return {
    exe = 'rustfmt',
    args = { '--emit=stdout' },
    stdin = true,
  }
end

local function autopep8()
  return {
    exe = 'python3 -m autopep8',
    args = {
      '--in-place --aggressive --aggressive',
      vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = false,
  }
end

require('formatter').setup({
  filetype = {
    lua = {
      stylua,
    },
    markdown = {
      prettier,
    },
    yaml = {
      prettier,
    },
    json = {
      prettier,
    },
    cpp = {
      clang_format,
    },
    rust = {
      rustfmt,
    },
    python = {
      autopep8,
    },
  },
})
