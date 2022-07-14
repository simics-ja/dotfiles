# Cheet sheet for my vim env

## Keymaps independent on plugins

### Normal mode

```
<C-h>/<C-j>/<C-k>/<C-l>   " split window movement
<TAB>/<S-TAB>             " tab edit movement
```

### Insert mode 

```
<C-h>/<C-j>/<C-k>/<C-l>   " cursor movement
jj                        " Escape insert mode (valid even if IME is enabled)
```

## File explorer

- [lambdalisue/fern.vim](https://github.com/lambdalisue/fern.vim)
- [yuki-yano/fern-preview.vim](https://github.com/yuki-yano/fern-preview.vim)

### Toggle explorer

```
<SPACE>e    " open file explorer
```

### Action on fern explorer

```
e           " open
t           " open with tab edit
E           " open with side window
s           " open and select window
N           " new file
K           " new directory
R           " rename
c           " copy
m           " move
C           " copy to clipboard
M           " move to clipboard
P           " paste from clipboard
D           " trush
y           " yank file path
i           " move cursor to path string
fi          " show only files matching your pattern string (file include)
a           " execute fern action
fe          " hide files matching your pattern string (file exclude)
!           " hide hidden file
?           " help
```

## Termainal

- [kassio/neoterm](https://github.com/kassio/neoterm)

```
<SPACE>t    " Toggle terminal on vim
```

## Fuzzy finder

- [junegunn/fzf.vim](https://github.com/junegunn/fzf.vim)

```
<SPACE>f    " file search
<SPACE>g    " git-managed file search
<SPACE>m    " git-modified file search
<SPACE>r    " ripgrep search for project files
<SPACE>b    " opened buffer search
<SPACE>w    " window search
<SPACE>h    " history search
<SPACE>l    " commit log search
<SPACE>p    " vim command search
```

## Git

- [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- [tpope/vim-rhubarb](https://github.com/tpope/vim-rhubarb)

```
\gb         " git blame
\gd         " git diff
\gl         " git log
\gw         " write and git add
\gr         " git checkout --
\go         " open remote repository with browser
```

## Relative line number

- [vim-scripts/RltvNmbr.vim](https://github.com/vim-scripts/RltvNmbr.vim)

```
\\          " toggle relative line number
```

## Spell checker

- [kamykn/spelunker.vim](https://github.com/kamykn/spelunker.vim)

```
ZL          " suggest correct words in buffer
Zl          " suggest correct words under cursor
```

## Comment out

- [commentary.vim](https://github.com/tpope/vim-commentary)

```
gcc         " current line
gcap        " paragraph
{Visual}gc  " with visual mode
```

## LaTeX

- [lervag/vimtex](https://github.com/lervag/vimtex)

```
\ll         " Start compiling
\lk         " Stop compiling
\lc         " Clear auxiality files
\lv         " Open compiled PDF
\le         " Close quickfix menu(In quickfix menu, <Enter> enables code jump.)
\lt         " Show a window with a table of contents:
```

