set number
set secure
set hidden
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.out
set ruler
set showcmd
set noerrorbells
set modeline
set incsearch
set scrolloff=6
set fillchars+=vert:/
set diffopt+=vertical
set mouse=a

" identation
set autoindent
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=8
set splitbelow
set backspace=indent,eol,start

set timeoutlen=1000 ttimeoutlen=0
set nobackup

set updatetime=300

syntax on
filetype plugin indent on

" keybindings START

let mapleader=","

" to uncomment as soon as https://github.com/neovim/neovim/issues/5916 is fixed (C-I - TAB)
"nmap <Tab> ==
imap <Tab> <C-v><Tab>

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

" undo
nmap <Leader>u :GundoToggle<CR>

" fzf
nmap <leader>p :GFiles<CR>
nmap <leader>o :FZFMru --multi<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>l :Commits<CR>
nmap <leader>h :BCommits<CR>
nnoremap <leader>sc :Ag <C-R><C-W><CR>

" file tree
nmap <leader>t :NvimTreeToggle<CR>
nmap <leader>f :NvimTreeFindFileToggle<CR>

" autocomplete & global lint

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" keybindings END

"plugins START

call plug#begin('~/.config/nvim/plugged')

" colorscheme
Plug 'morhetz/gruvbox'

" undo
Plug 'sjl/gundo.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

" ui bars & icons
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" file tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" autocomplete & global lint
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

" syntax
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" extras
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'chilicuil/vim-sprunge'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sbdchd/neoformat'

call plug#end()

"plugins END

"plugins-config START

" colorscheme
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'soft'
set background=dark
colorscheme gruvbox

" undo
let g:gundo_prefer_python3 = 1

" ui bars & icons
set encoding=utf8
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" files navigation
let g:fzf_layout = { 'down': '40%' }
let g:fzf_mru_relative = 1
let g:fzf_mru_no_sort = 1

lua << EOF
  require("nvim-tree").setup()
EOF

" autocomplete & global lint
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

highlight CocErrorFloat ctermfg=White guifg=#ffffff

" coc extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-pairs', 'coc-highlight', 'coc-eslint']

"plugins-config END
