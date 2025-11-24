local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color schemes
  'sainnhe/gruvbox-material',
  'folke/tokyonight.nvim',
  'rebelot/kanagawa.nvim',
  'savq/melange-nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },

  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'lewis6991/gitsigns.nvim',

  -- Navigation
  {
    'ibhagwan/fzf-lua',
    branch = 'main'
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    }
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },
  'nvim-treesitter/nvim-treesitter-refactor',
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = 'nvim-treesitter/nvim-treesitter'
  },
  'hiphish/rainbow-delimiters.nvim',
  'andymass/vim-matchup',
  'windwp/nvim-ts-autotag',

  -- LSP
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'stevearc/conform.nvim',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('typescript-tools').setup {}
    end,
  },

  -- Autocompletion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/nvim-cmp',
  'github/copilot.vim',

  -- Misc
  'lukas-reineke/indent-blankline.nvim',
  'tpope/vim-endwise',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'tpope/vim-rails',
  'kevinhwang91/nvim-bqf',
})
