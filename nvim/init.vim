syntax enable

let g:netrw_home=$XDG_CACHE_HOME.'/vim'

scriptencoding UTF-8
set encoding=UTF-8
set t_Co=64
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number
set nu rnu " relative numbers
" set mouse=a " mouse support
set foldmethod=indent
set foldlevel=99
let mapleader=" "

" source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

autocmd VimEnter, VimLeave * silent !tmux set status off
autocmd FileType python source ~/.config/nvim/lang/python.vim
autocmd FileType go source ~/.config/nvim/lang/go.vim
autocmd FileType html source ~/.config/nvim/lang/web.vim
autocmd FileType css source ~/.config/nvim/lang/web.vim
autocmd FileType javascript source ~/.config/nvim/lang/web.vim
autocmd FileType javascriptreact source ~/.config/nvim/lang/web.vim
autocmd FileType typescript source ~/.config/nvim/lang/web.vim
autocmd FileType typescriptreact source ~/.config/nvim/lang/web.vim


lua <<EOF
vim.opt.mouse = ''
vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>', '<nop>')

vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeFindFileToggle<CR>')

-- disable arrow keys
vim.keymap.set('v', '<Up>', '<nop>')
vim.keymap.set('v', '<Down>', '<nop>')
vim.keymap.set('v', '<Left>', '<nop>')
vim.keymap.set('v', '<Right>', '<nop>')
vim.keymap.set('i', '<Up>', '<nop>')
vim.keymap.set('i', '<Down>', '<nop>')
vim.keymap.set('i', '<Left>', '<nop>')
vim.keymap.set('i', '<Right>', '<nop>')

-- disable simple navigation
vim.keymap.set('n', 'h', '<nop>')
vim.keymap.set('n', 'l', '<nop>')

-- move between panes
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- move between tabs
vim.keymap.set('n', 'H', 'gT')
vim.keymap.set('n', 'L', 'gt')

EOF
