set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set formatoptions+=cronm

set number
set secure
set hidden
set nobackup
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.out
set ruler
set cursorline
set showcmd
set noerrorbells
set modeline
set incsearch
set scrolloff=6
set diffopt+=vertical
set encoding=utf8

set mouse=a

" KEYBINDINGS

let mapleader=","

" movements
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-j> :bf<CR>
nmap <C-k> :bl<CR>
nmap <C-d> :bd<CR>
nmap ˚ :wincmd k<CR>
nmap ∆ :wincmd j<CR>
nmap ˙ :wincmd h<CR>
nmap ¬ :wincmd l<CR>

" copy path
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

" file tree
nmap <leader>f :Neotree filesystem toggle reveal position=left<CR>

" telescope
nmap <leader>p <cmd>Telescope find_files<cr>
nmap <leader>o <cmd>Telescope frecency<cr>
nmap <leader>e <cmd>Telescope live_grep<cr>
nmap <leader>r <cmd>Telescope grep_string<cr>
nmap <leader>b <cmd>Telescope buffers<cr>
nmap <leader>gd <cmd>Telescope lsp_definitions<cr>
nmap <leader>gg <cmd>Telescope lsp_implementations<cr>

" diagnostics
nmap <leader>xx <cmd>Trouble diagnostics toggle<cr>
nmap <leader>xs <cmd>Trouble lsp toggle<cr>

nmap gr <cmd>lua vim.lsp.buf.references()<cr>

nmap <Plug>DisableSprungeMapping <Plug>Sprunge
xmap <Plug>DisableSprungeMapping <Plug>Sprunge

" copilot
inoremap <silent><expr> <C-s> copilot#Accept("")
let g:copilot_no_tab_map = 1

" highlight
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" PLUGINS

call plug#begin('~/.config/nvim/plugged')

" colorscheme
"Plug 'sainnhe/gruvbox-material'
"Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
"Plug 'ellisonleao/gruvbox.nvim'
"Plug 'morhetz/gruvbox'

" git
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rhubarb'
"Plug 'mhinz/vim-signify'

" telescope
"Plug 'nvim-telescope/telescope.nvim', { 'branch': 'master' }
"Plug 'nvim-telescope/telescope-frecency.nvim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

" file tree
"Plug 'nvim-neo-tree/neo-tree.nvim'
"Plug 'nvim-tree/nvim-web-devicons'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'MunifTanjim/nui.nvim'

" treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/nvim-treesitter-refactor'
"Plug 'hiphish/rainbow-delimiters.nvim'
"Plug 'andymass/vim-matchup'
"Plug 'windwp/nvim-ts-autotag'

" LSP
"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/mason.nvim'
"Plug 'williamboman/mason-lspconfig.nvim'
"Plug 'stevearc/conform.nvim'
"Plug 'folke/trouble.nvim'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'

" LLMs
"Plug 'github/copilot.vim'

" extras
"Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'tpope/vim-endwise'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-repeat'

call plug#end()

" PLUGINS CONFIG
" color scheme
"let g:termguicolors=0
"if has('termguicolors')
"  set termguicolors
"endif
"let g:gruvbox_material_background = 'medium'
"let g:gruvbox_material_foreground = 'material'
"let g:gruvbox_material_better_performance = 1
"let g:gruvbox_contrast_dark="medium"
"set background=dark
colorscheme sorbet

"lua << ENDOFLUA
"require('nvim-treesitter.configs').setup({
"  ensure_installed = {
"    "c", "lua", "vim", "vimdoc", "javascript", "python", "nginx",
"    "bash", "dockerfile", "html", "json", "yaml", "ruby"
"  },
"  ignore_install = { "gitcommit" },
"  auto_install = true,
"  indent = {
"    enable = true,
"  },
"  incremental_selection = {
"    enable = true,
"    keymaps = {
"      init_selection = "gnn",
"      node_incremental = "gan",
"      scope_incremental = "gac",
"      node_decremental = "grm",
"    },
"  },
"  autotag = {
"    enable = true,
"  },
"  highlight = {
"    enable = true,
"    additional_vim_regex_highlighting = false,
"  },
"  refactor = {
"    highlight_definitions = {
"      enable = true,
"      clear_on_cursor_move = true,
"    },
"    highlight_current_scope = { enable = false },
"    smart_rename = {
"      enable = true,
"      keymaps = {
"        smart_rename = "R",
"      },
"    },
"  },
"})
"vim.opt.indentexpr = ''
"vim.opt.smartindent = true
"-- lsp
"require('mason').setup({})
"require('mason-lspconfig').setup({
"  automatic_installation = true,
"  ensure_installed = { "ts_ls", "clangd", "pyright", "ruff_lsp" },
"})
"require 'lspconfig'.eslint.setup({
"settings = {
"  	packageManager = 'pnpm',
"  },
"  on_attach = function(client, bufnr)
"  vim.api.nvim_create_autocmd("BufWritePre", {
"    buffer = bufnr,
"    command = "EslintFixAll",
"  })
"  end,
"})
"--  formatter
"require("conform").setup({
"formatters_by_ft = {
"  javascript = { "eslint_d" },
"  javascriptreact = { "eslint_d" },
"  typescript = { "eslint_d" },
"  typescriptreact = { "eslint_d" },
"  python = { "ruff_format" },
"},
"})
"vim.api.nvim_create_autocmd("BufWritePre", {
"  pattern = "*",
"  callback = function(args)
"  require("conform").format({ bufnr = args.buf, quiet = true })
"  end,
"})
"-- cmp
"local cmp = require'cmp'
"cmp.setup {
"  sources = {
"    { name = 'nvim_lsp' },
"    { name = 'nvim_lsp_signature_help' },
"    },
"  completion = {
"    keyword_length = 0,
"    },
"  mapping = cmp.mapping.preset.insert({
"  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
"  ['<C-e>'] = cmp.mapping.abort(),
"  ['<CR>'] = cmp.mapping.confirm({ select = false }),
"  }),
"}
"local capabilities = require('cmp_nvim_lsp').default_capabilities()
"require('lspconfig').ts_ls.setup {
"  capabilities = capabilities,
"}
"require('lspconfig').ruff_lsp.setup({
"    filetypes = { "python" },
"    capabilities = capabilities,
"})
"require('lspconfig').pyright.setup({
"  filetypes = { "python" },
"  capabilities = capabilities,
"})
"require 'lspconfig'.clangd.setup {}
"---- diagnostics
"require("trouble").setup({
"  auto_open = false,
"})
"-- telescope
"require('telescope').load_extension('frecency')
"require('telescope').setup{
"  defaults = {
"    mappings = {
"      i = {
"        ["<C-j>"] = require('telescope.actions').move_selection_next,
"        ["<C-k>"] = require('telescope.actions').move_selection_previous,
"        ["<Esc>"] = require('telescope.actions').close,
"      },
"      n = {
"        ["<C-j>"] = require('telescope.actions').move_selection_next,
"        ["<C-k>"] = require('telescope.actions').move_selection_previous,
"        ["<Esc>"] = require('telescope.actions').close,
"      }
"    },
"  }
"}
"-- tree
"require("neo-tree").setup({
"event_handlers = {{
"      event = "file_open_requested",
"      handler = function()
"      require("neo-tree.command").execute({ action = "close" })
"      end
"}},
"window = {
"  mappings = {
"    ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
"  }
"  },
"  filesystem = {
"    follow_current_file = {
"      enabled = false,
"    }
"    }
"  })
"-- Misc
"require("ibl").setup({
"scope = {
"  show_start = false,
"  show_end = true,
"},
"})
"ENDOFLUA
