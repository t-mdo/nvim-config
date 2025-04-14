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
vim.keymap.set('n', '˚', ':wincmd k<CR>')
vim.keymap.set('n', '∆', ':wincmd j<CR>')
vim.keymap.set('n', '˙', ':wincmd h<CR>')
vim.keymap.set('n', '¬', ':wincmd l<CR>')

-- Copy Path
vim.keymap.set('n', ',cs', ':let @*=expand("%")<CR>')
vim.keymap.set('n', ',cl', ':let @*=expand("%:p")<CR>')

-- File Tree
vim.keymap.set('n', '<leader>f', ':Neotree filesystem reveal toggle position=left<CR>')
vim.keymap.set('n', '<leader>F', ':Neotree filesystem reveal toggle position=current<CR>')

-- FZF
vim.keymap.set('n', '<leader>p', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>FzfLua oldfiles<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>FzfLua grep<cr>')
vim.keymap.set('n', '<leader>E', '<cmd>FzfLua grep_last<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>FzfLua grep_cword<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>gd', '<cmd>FzfLua lsp_definitions<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>FzfLua lsp_references<cr>')
vim.keymap.set('n', '<leader>xs', '<cmd>FzfLua diagnostics_workspace<cr>')
vim.keymap.set('n', '<leader>xx', ':lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<cr>')

-- Treesitter
vim.keymap.set('n', ',cc', '<cmd>TSContextToggle<cr>')

-- LSP
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-s>', 'copilot#Accept("")', { expr = true, silent = true })

-- File Type Detection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.json.jbuilder",
  command = "set ft=ruby"
})
