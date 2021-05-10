call plug#begin('~/.vim/plugged')

runtime! plugins.vim

" Initialize plugin system
call plug#end()

if (has("nvim"))
  set inccommand=split
endif

filetype plugin indent on
syntax enable

let g:plug_shallow = 1
