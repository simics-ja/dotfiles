" Specify a directory for plugins
" - For Neovim: stdpatr('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" Newly install Plug > :PlugInstall
" Remove unused Plug > :PlugClean

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Japanese Doc
Plug 'vim-jp/vimdoc-ja'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

" LaTeX
Plug 'lervag/vimtex'

" Status Line
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Indent Line
Plug 'Yggdroot/indentLine'

" Git
Plug 'tpope/vim-fugitive'                       " Git wrapper for vim
Plug 'tpope/vim-rhubarb'                        " :GBrowse handler for fugitive
Plug 'airblade/vim-gitgutter'                   " Show line's git diff

" Terminal
Plug 'kassio/neoterm'

" File explorer
Plug 'lambdalisue/fern.vim'
Plug 'yuki-yano/fern-preview.vim'               " File preview
Plug 'lambdalisue/fern-git-status.vim'          " Show file's git status
Plug 'lambdalisue/nerdfont.vim'                 " Nerd font
Plug 'lambdalisue/fern-renderer-nerdfont.vim'   " Nerd font renderer
Plug 'lambdalisue/glyph-palette.vim'            " Icon colorizer
Plug 'lambdalisue/fern-hijack.vim'              " Set Fern as default explorer

" Comment out
Plug 'tpope/vim-commentary'

" Spell checker
Plug 'kamykn/spelunker.vim'

" Line number
Plug 'vim-scripts/RltvNmbr.vim'

" Cheat sheet
Plug 'reireias/vim-cheatsheet'

" Initialize plugin system
call plug#end()
