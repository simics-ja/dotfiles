" Set Leader key
let mapleader = "\<Space>"

" Change focusing tab
nmap <Tab>      gt
nmap <S-Tab>    gT

" Enable cursor movement on insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Enable split window movement
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Escape by jj
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

" Reset highlight after hlsearch
nnoremap <ESC><ESC> :nohl<CR>

" Completion behavior
" Enter's behavior in selecting Completion Candidate
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<LF>"
" Up and down key behaviour in completion
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
