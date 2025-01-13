vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.formatoptions:append('cronm')

vim.opt.number = true
vim.opt.secure = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildignore = '*.o,*.obj,*.bak,*.exe,*.out'
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.errorbells = false
vim.opt.modeline = true
vim.opt.incsearch = true
vim.opt.scrolloff = 6
vim.opt.diffopt:append('vertical')
vim.opt.encoding = 'utf8'
vim.opt.mouse = 'a'

require('plugins')
require('keymaps')
require('treesitter')
require('colorscheme')
require('file_navigation')
require('lsp')
require('misc')
