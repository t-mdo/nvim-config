require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "c", "cpp", "lua", "vim", "vimdoc", "javascript", "typescript", "tsx", "ruby", "python", "nginx",
    "bash", "dockerfile", "html", "css", "json", "yaml"
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gan",
      scope_incremental = "gac",
      node_decremental = "grm",
    },
  },
  autotag = {
    enable = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "R",
      },
    },
  },
})
vim.opt.smartindent = true
vim.bo.autoindent = true
vim.bo.smartindent = true
