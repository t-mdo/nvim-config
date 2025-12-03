-- Leader Key
vim.g.mapleader = ','

-- Key Mappings
-- Buffer Navigation
vim.keymap.set('n', '<C-h>', ':bp<CR>')
vim.keymap.set('n', '<C-l>', ':bn<CR>')
vim.keymap.set('n', '<C-j>', ':bf<CR>')
vim.keymap.set('n', '<C-k>', ':bl<CR>')
vim.keymap.set('n', '<C-d>', ':bd<CR>')

-- Window Navigation
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to split below' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to split above' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to right split' })

-- Copy Path
vim.keymap.set('n', ',cs', ':let @*=expand("%")<CR>')
vim.keymap.set('n', ',cl', ':let @*=expand("%:p")<CR>')

-- File Tree
vim.keymap.set('n', '<leader>f', ':Neotree filesystem reveal toggle position=right<CR>')
vim.keymap.set('n', '<leader>F', ':Neotree filesystem reveal toggle position=current<CR>')

-- FZF
vim.keymap.set('n', '<leader>p', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>FzfLua oldfiles<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>FzfLua grep<cr>')
vim.keymap.set('n', '<leader>t', '<cmd>FzfLua grep --type ts<cr>')
vim.keymap.set('n', '<leader>E', '<cmd>FzfLua grep resume=true<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>FzfLua grep_cword<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>j', '<cmd>FzfLua jumps<cr>')
vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status<cr>')
vim.keymap.set('n', '<leader>gc', '<cmd>FzfLua git_commits<cr>')
vim.keymap.set('n', '<leader>gb', '<cmd>FzfLua git_branches<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>FzfLua lsp_document_diagnostics<cr>')
vim.keymap.set('n', '<leader>D', '<cmd>FzfLua lsp_workspace_diagnostics<cr>')
vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<cr>')
vim.keymap.set('n', 'gt', '<cmd>FzfLua lsp_typedefs<cr>')
vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<cr>')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grt')
vim.keymap.del('n', 'grn')

vim.keymap.set('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>')
vim.keymap.set('n', '<leader>i', '<cmd>TSToolsAddMissingImports<cr>')
vim.keymap.set('n', '<leader>x', '<cmd>lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>')

-- Treesitter
vim.keymap.set('n', ',cc', '<cmd>TSContext toggle<cr>')

-- LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- Copilot
--vim.g.copilot_no_tab_map = false
vim.api.nvim_set_keymap('i', '<C-s>', 'copilot#Accept("")', { expr = true, silent = true })

-- File Type Detection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.json.jbuilder",
  command = "set ft=ruby"
})
