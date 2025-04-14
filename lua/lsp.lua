-- lsp
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "ts_ls", "eslint", "clangd", "pyright", "ruff" }, -- ruby_lsp in project gemfile to use rbenv
})
require 'lspconfig'.eslint.setup({
settings = {
  	packageManager = 'pnpm',
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})
require('lspconfig').ruby_lsp.setup({
  cmd = { 'ruby-lsp' },
  cmd_env = {
    PATH = vim.fn.getenv('PATH'),
  }
})
--  formatter
require("conform").setup({
  formatters_by_ft = {
    c = { "clang_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    python = { "ruff_format" },
  },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf, quiet = true })
  end,
})
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
    keyword_length = 0,
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').ts_ls.setup {
  capabilities = capabilities,
}
require('lspconfig').ruff.setup({
  filetypes = { "python" },
  capabilities = capabilities,
})
require('lspconfig').pyright.setup({
  filetypes = { "python" },
  capabilities = capabilities,
})
require 'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
require 'lspconfig'.ruby_lsp.setup {
  capabilities = capabilities,
}
