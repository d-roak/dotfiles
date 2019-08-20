set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'

Plugin 'sheerun/vim-polyglot'

Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'

Plugin 'junegunn/fzf.vim'

" Remove this somewehere in time
Plugin 'dikiaap/minimalist'

" Plugin 'w0rp/ale'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'artur-shaik/vim-javacomplete2'

" Try to make this work??
" Plugin 'Floobits/floobits-vim'
call vundle#end()

" Airline.
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" NERDTree
" autocmd VimEnter * NERDTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos = 'right'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1

" ALE linter
"let g:ale_linters = ['javac', 'pylint']

" Syntastic
"set statusline+=%#warning#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
