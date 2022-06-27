
call plug#begin()
Plug 'github/copilot.vim', {'branch': 'release'} " Auto completion
" File viewer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting
Plug 'nvim-lualine/lualine.nvim' " Line
Plug 'junegunn/seoul256.vim' " Theme

Plug 'tpope/vim-fugitive' " Git
Plug 'mhinz/vim-signify' " Git status line

Plug 'rcarriga/nvim-notify'
call plug#end()

let g:seoul256_background = 237
colo seoul256

lua << EOF
require("nvim-tree").setup()
require("lualine").setup()
EOF
