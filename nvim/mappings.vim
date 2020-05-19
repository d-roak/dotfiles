
" Shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-Left> :tabprevious<CR>
map <C-Right> :tabnext<CR>
map <C-n> :NERDTreeToggle<CR>

command Q :qa
command Wq :wqa

" sudo writing
command Suw w !sudo tee %
