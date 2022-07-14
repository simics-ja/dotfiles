" File search
nnoremap <Leader>f :FZF<CR>

" Git-managed file search
nnoremap <Leader>g :GFiles<CR>

" Modified File search
nnoremap <Leader>m :GFiles?<CR>

" String Serch with ripgrep
nnoremap <Leader>r :Rg<CR>

" Opened Buffers search
nnoremap <Leader>b :Buffers<CR>

" Window search
nnoremap <Leader>w :Windows<CR>

" History search
nnoremap <Leader>h :History<CR>

" Commits search
nnoremap <Leader>l :Commits<CR>

" Command search
nnoremap <Leader>p :Commands<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
