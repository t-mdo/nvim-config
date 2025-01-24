local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use 'sainnhe/gruvbox-material'

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- Navigation
  use 'ibhagwan/fzf-lua'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim'
    }
  }
  use {'akinsho/bufferline.nvim', commit = '9f0826ae6adfd836a23bf8a4910e3c07450211f4', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'hiphish/rainbow-delimiters.nvim'
  use 'andymass/vim-matchup'
  use 'windwp/nvim-ts-autotag'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'stevearc/conform.nvim'

  -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/nvim-cmp'
  use 'github/copilot.vim'

  -- Misc
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-endwise'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rails'
  use 'kevinhwang91/nvim-bqf'
end)
