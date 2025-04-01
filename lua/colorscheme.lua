-- Color Scheme Configuration
if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end
vim.o.background = "dark"
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 0
vim.cmd.colorscheme('gruvbox-material')
vim.g.rainbow_delimiters = {
  query = {
    [''] = 'rainbow-parens',
  },
}
vim.api.nvim_set_hl(0, "@keyword.import", { link = "Orange" })
vim.api.nvim_set_hl(0, "@keyword.function", { link = "Aqua" })
vim.api.nvim_set_hl(0, "@keyword.modifier", { link = "Aqua" })
vim.api.nvim_set_hl(0, "@string", { link = "Aqua" })
vim.api.nvim_set_hl(0, "@string.special.symbol", { link = "Purple" })
vim.api.nvim_set_hl(0, "@tag.javascript", { link = "GreenBold" })
vim.api.nvim_set_hl(0, "@tag.tsx", { link = "GreenBold" })
vim.api.nvim_set_hl(0, "@tag.builtin", { link = "Blue" })
vim.api.nvim_set_hl(0, "@tag.delimiter", { link = "Blue" })
vim.api.nvim_set_hl(0, "@tag.attribute", { link = "Yellow" })
