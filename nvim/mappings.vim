
" Disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Hard mode navigation
" nnoremap h <Nop>
" nnoremap j <Nop>
" nnoremap k <Nop>
" nnoremap l <Nop>

" Move between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" Move panes (don't work)
nnoremap <C-S-J> <C-W>J
nnoremap <C-S-K> <C-W>K
nnoremap <C-S-H> <C-W>H
nnoremap <C-S-L> <C-W>L

" Move between tabs
nnoremap H gT
nnoremap L gt

" Quick exit
nnoremap <C-Q> <C-W>q
" Open file explorer
nnoremap <leader>t <cmd>NvimTreeFindFileToggle<CR>

" alias
command Q :qa
command Wq :wqa

" sudo writing
command Suw w !sudo tee %

" vim snip
