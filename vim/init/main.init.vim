" == Environment compatibility ==
set encoding=utf-8              " vim internal text e.g. buffer text
set fileencoding=utf-8          " write text
set fileencodings=utf-8         " read text
set fileformats=unix,dos,mac

" == Editor config ==
syntax on                       " syntax highlight
set number                      " show line number
set cursorline                  " highlight line number
set wrap                        " word wrap 
set shiftwidth=2                " indent width
set softtabstop=2               " insert number of space by tab
set tabstop=2                   " display width of tab character
set expandtab                   " tab to space
set autoread                    " reload file change automatically
set clipboard+=unnamed          " yank to clipboard
set mouse=a                     " enable mouse scroll
set splitbelow                  " open new window below
set splitright                  " open new window right
set wildmenu                    " show command candidate on status line
set laststatus=2                " always show status line 
set hidden                      " enable undo if change buffer
set nospell                     " spell check
set whichwrap=b,s,h,l,<,>,[,],~ " horizontal cursor movement over line
set scrolloff=3                 " scroll margin
set backspace=indent,eol,start  " always enable backspace
set colorcolumn=80              " color column line

" == String search ==
set ignorecase                  " ignore case
set smartcase                   " if search string includes upper case, discriminates case.
set wrapscan                    " rewind string search to first from last
set incsearch                   " incremental search
set hlsearch                    " highlight matched keyword

" == Code completion ==
set pumheight=10                " completion candidate
set completeopt=menuone,noinsert

" Disable IME by escape
function! Fcitx2en()
 let s:input_status = system("fcitx-remote")
 if s:input_status == 2
    let l:a = system("fcitx-remote -c")
 endif
endfunction

set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en()

" == Color config ==
hi clear CursorLine
hi clear MatchParen
hi MatchParen ctermfg=darkred
hi clear Error
hi Error ctermfg=black ctermbg=darkred
hi clear Search
hi Search cterm=underline ctermbg=darkgray
hi clear SpelunkerSpellBad
hi SpelunkerSpellBad cterm=underline
hi clear ColorColumn 
hi ColorColumn ctermbg=darkgray
hi clear CursorLineNr
hi CursorLineNr ctermfg=magenta
hi clear Pmenu 
hi Pmenu ctermfg=242 ctermbg=0
hi clear PmenuSel
hi PmenuSel ctermfg=0 ctermbg=13

