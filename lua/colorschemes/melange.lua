-- Color Scheme Configuration
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end
vim.o.background = "dark"

vim.cmd.colorscheme('melange')
