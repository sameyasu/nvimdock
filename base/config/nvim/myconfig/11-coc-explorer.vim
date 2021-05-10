let g:coc_explorer_global_presets = {
\   'nvim-myconfig': {
\      'root-uri': '~/.config/nvim/myconfig',
\   },
\ }

" Open explorer
nmap <c-n> :CocCommand explorer<CR>

nnoremap <space>m :CocCommand explorer --preset nvim-myconfig<CR>
