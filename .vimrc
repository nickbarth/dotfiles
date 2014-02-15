" Vundle Setup
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'msanders/snipmate.vim'

filetype plugin indent on

" ignores
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so
set wildignore+=*.dat,*.png,*.jpg,*.gif,*.eot,*.svg,*.ttf,*.woff

" .vimrc
syntax on                      " Syntax highlighting on
color peachpuff                " My favorite color scheme

set autoindent                 " Copy indent from current line when starting a new line
set backspace=2                " Two character automatic placement after <
set cindent                    " C style indenting rules
set complete=.,b,u,]           " Auto complete from current buff, loaded buffs, unloaded buffs, and tags
set directory=/tmp/            " Hide backups away in the tmp directory
set expandtab                  " Expand tabs to spaces
set foldlevelstart=99          " Unfold all code folding
set foldmethod=indent          " Cold folding mode set to indents
set ignorecase                 " Ignore case while searching
set incsearch                  " Search a word as its typed
set lisp                       " Auto complete words with dashes
set list                       " Show whitespace
set listchars=tab:..,trail:.   " Show whitespace as periods
set noerrorbells               " No beeping
set nohlsearch                 " No search highlighting
set novisualbell               " No screen flashing
set nowrap                     " No text wrapping
" set paste                      " Always be in paste mode in insert
set path=**                    " Recursive path for easier ':find example.ext'
set rnu                        " Relative line numbering for easier movement
set nu                         " Show current line number
set ruler                      " Show the current row and column at the bottom right of the screen
set shiftwidth=2               " Two spaces inserted for indentation
set shortmess+=I               " No startup screen
set showmatch                  " Show matching bracket or parenthesis
set smartcase                  " Case sensitive search when case is used
set smarttab                   " Insert tab space on new line
set spelllang=en_us            " Sets dictionary
set nospell                    " Spell check off by default
set showtabline=2              " Always show tabline
set tabstop=2                  " Tabs are 2 spaces
set wildmode=longest,list      " Longest then list completion mode
" set virtualedit=all            " Virtual spaces for ascii art

let mapleader = " "
nnoremap <leader><leader> <c-^>

nnoremap <Leader>l :ls<CR>
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>j :bp<CR>
nnoremap <Leader>k :bn<CR>
nnoremap <Leader>r :source ~/.vimrc<CR>
nnoremap <leader>R :e ~/.vimrc<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>g :CtrlPBuffer<CR>
nnoremap <leader>e :E<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :x<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>s :vs<CR>
nnoremap <leader>v :sp<CR>
nnoremap <leader>p :CtrlPClearCache<CR>
nnoremap <leader>; :grep -Ri --exclude="tags" --exclude-dir="node_modules" --exclude-dir="git" --exclude="min" 
nnoremap <leader>a :tab expand("<cword>")<CR>
