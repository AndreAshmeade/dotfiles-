if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

 

filetype plugin on

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'folke/twilight.nvim'

Plug 'mhinz/vim-startify'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

"HTML Stynax 
Plug 'mattn/emmet-vim'

"Javascript Stynax 
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'jelera/vim-javascript-syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dense-analysis/ale'
Plug 'leafgarland/typescript-vim'
Plug 'leshill/vim-json'


Plug 'airblade/vim-gitgutter'
Plug 'folke/zen-mode.nvim'
Plug 'preservim/nerdcommenter'
 

Plug 'morhetz/gruvbox'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} 
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

