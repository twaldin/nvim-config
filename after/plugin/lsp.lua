-- In your lsp.lua file
local lspconfig = require('lspconfig')

-- Clean, minimal clangd setup
lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never", -- Try 'never' instead of 'iwyu' to avoid diagnostic noise
  },
  filetypes = { "c" },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(
      'compile_commands.json',
      'compile_flags.txt',
      '.git'
    )(fname) or vim.fn.getcwd()
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  -- Basic key mappings
  on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
}
