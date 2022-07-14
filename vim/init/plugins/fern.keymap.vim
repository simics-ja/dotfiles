nnoremap <silent> <Leader>e :<C-u>Fern . -reveal=% -drawer -toggle -width=40<CR>

" Plugin: Fern Preview config
" Preview leaf content by j/k like VS code
function! s:fern_preview_init() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-preview-or-nop)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:edit)\<C-w>p",
        \   "",
        \ )
  nmap <buffer><expr> j
        \ fern#smart#drawer(
        \   "j\<Plug>(fern-my-preview-or-nop)",
        \   "j",
        \ )
  nmap <buffer><expr> k
        \ fern#smart#drawer(
        \   "k\<Plug>(fern-my-preview-or-nop)",
        \   "k",
        \ )
endfunction

function! s:init_fern() abort
  " Enable split window movement on fern
  nnoremap <buffer> <C-H> <C-W>h
  nnoremap <buffer> <C-J> <C-W>j
  nnoremap <buffer> <C-K> <C-W>k
  nnoremap <buffer> <C-L> <C-W>l
endfunction

augroup my-fern-preview
  autocmd! *
  autocmd FileType fern call s:fern_preview_init()
  autocmd FileTYpe fern call s:init_fern()
augroup END
