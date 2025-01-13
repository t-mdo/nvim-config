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
vim.keymap.set('n', '<leader>f', ':Neotree filesystem toggle reveal position=left<CR>')

-- FZF
vim.keymap.set('n', '<leader>p', '<cmd>FzfLua files<cr>')
vim.keymap.set('n', '<leader>o', '<cmd>FzfLua oldfiles<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>FzfLua grep<cr>')
vim.keymap.set('n', '<leader>E', '<cmd>FzfLua grep_last<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>FzfLua grep_cword<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
vim.keymap.set('n', '<leader>gd', '<cmd>FzfLua lsp_definitions<cr>')
vim.keymap.set('n', '<leader>gg', '<cmd>FzfLua lsp_implementations<cr>')
vim.keymap.set('n', '<leader>xx', '<cmd>FzfLua diagnostics_document<cr>')
vim.keymap.set('n', '<leader>xp', '<cmd>FzfLua diagnostics_project<cr>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

-- Copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-s>', 'copilot#Accept("")', { expr = true, silent = true })

-- File Type Detection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.json.jbuilder",
  command = "set ft=ruby"
})
