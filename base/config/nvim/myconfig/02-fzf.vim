let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

let g:fzf_preview_window = ['down:40%', 'ctrl-/']

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir ProjectFiles
    \ call fzf#vim#files(
        \ systemlist('git rev-parse --show-toplevel')[0],
        \ fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}),
        \ <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

noremap <C-i> :Rgword<CR>
command! -bang -nargs=0 Rgword
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.expand("<cword>"), 1,
  \   fzf#vim#with_preview({'options': ['--layout=reverse']}), <bang>0)

" like a ctrl-p plugin
map <silent> <C-p> :Files<CR>

map <silent> <C-t> :Windows<CR>

let g:fzf_buffers_jump = 1

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
