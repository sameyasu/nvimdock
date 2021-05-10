" vim: et ts=2 sts=2 sw=2
set number

set tabstop=4
set expandtab
set shiftwidth=4

set showmatch
set matchtime=1
set showtabline=2

map <C-d> :q<CR>
map <C-u> <C-b>

" yanks the end of line
noremap Y y$

" open init.vim
nnoremap <space>z :tabnew ~/.config/nvim/init.vim<CR>

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
