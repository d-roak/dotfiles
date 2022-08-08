
call plug#begin()
Plug 'github/copilot.vim', {'branch': 'release', 'for': ['rust','go','python','javascript','typescript']} " Auto completion
" File viewer
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighting
Plug 'nvim-lualine/lualine.nvim' " Line
Plug 'junegunn/seoul256.vim' " Theme

Plug 'tpope/vim-fugitive' " Git
Plug 'mhinz/vim-signify' " Git status line
Plug 'tpope/vim-surround' " add, change, delete surroundings

Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['rust','go','python','javascript','typescript']} " Code completion

Plug 'dense-analysis/ale', {'for': ['rust','go','python','javascript','typescript']} " Async Lint Engine
Plug 'rust-lang/rust.vim', {'for': 'rust'} " Rust

Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'nvie/vim-flake8', {'for': 'python'}
Plug 'tomlion/vim-solidity', {'for': 'solidity' }

Plug 'rcarriga/nvim-notify' " Visual notifications
call plug#end()

let g:seoul256_background = 237
colo seoul256

lua << EOF
require("nvim-tree").setup()
require("lualine").setup()
EOF
