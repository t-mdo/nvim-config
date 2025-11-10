-- lsp
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "eslint", "clangd", "pyright", "ruff", "rust_analyzer" }, -- ruby_lsp in project gemfile to use rbenv
})
vim.lsp.config('eslint', {
settings = {
  	packageManager = 'pnpm',
  },
})
vim.lsp.config('ruby_lsp', {
  cmd = { 'ruby-lsp' },
  cmd_env = {
    PATH = vim.fn.getenv('PATH'),
  }
})
--  formatter
require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    javascript = {
      "biome",
      "prettier",
      stop_after_first = true,
    },
    javascriptreact = {
      "biome",
      "prettier",
      stop_after_first = true,
    },
    typescript = {
      "biome",
      "prettier",
      stop_after_first = true,
    },
    typescriptreact = {
      "biome",
      "prettier",
      stop_after_first = true,
    },
    python = { "ruff_format" },
  },
  format_on_save = {
    lsp_fallback = true,
  },
})
require("conform").formatters.biome = {
  command = "biome",
  args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
  stdin = true,
}
local cmp = require'cmp'
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'treesitter' },
    { name = 'buffer' },
    { name = 'path' },
  },
  completion = {
    keyword_length = 1,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('ruff', {
  filetypes = { "python" },
  capabilities = capabilities,
})
vim.lsp.config('pyright', {
  filetypes = { "python" },
  capabilities = capabilities,
})
vim.lsp.config('clangd', {
  capabilities = capabilities,
})
vim.lsp.config('ruby_lsp', {
  capabilities = capabilities,
})
