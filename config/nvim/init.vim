set mouse=a
syntax enable

let g:netrw_home=$XDG_CACHE_HOME.'/vim'

scriptencoding UTF-8
set encoding=UTF-8
set t_Co=64
set tabstop=3 softtabstop=3 shiftwidth=3 expandtab
set number 

source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

" TODO
autocmd FileType java source ~/.config/nvim/lang/java.vim
autocmd FileType python source ~/.config/nvim/lang/python.vim
autocmd FileType go source ~/.config/nvim/lang/go.vim
