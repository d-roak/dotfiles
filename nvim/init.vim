syntax enable

let g:netrw_home=$XDG_CACHE_HOME.'/vim'

scriptencoding UTF-8
set encoding=UTF-8
set t_Co=64
" set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set number
set nu rnu " relative numbers
" set mouse=a " mouse support
set foldmethod=indent
set foldlevel=99

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

autocmd VimEnter, VimLeave * silent !tmux set status off
autocmd FileType python source ~/.config/nvim/lang/python.vim
autocmd FileType go source ~/.config/nvim/lang/go.vim
