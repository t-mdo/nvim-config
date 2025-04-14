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
  yati = {
    enable = true,
  },
  indent = {
    enable = false,
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
  },
})
require'treesitter-context'.setup({
  enable = false,
})
