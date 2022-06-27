
" Move between panes
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Move between tabs
nnoremap H gT
nnoremap L gt

" Quick exit
nnoremap <C-q> <C-W>q
" Open file explorer
nnoremap <leader>t <cmd>NvimTreeFindFileToggle<CR>

" alias
command Q :qa
command Wq :wqa

" sudo writing
command Suw w !sudo tee %
