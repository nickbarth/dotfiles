" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
filetype plugin indent on

" .vimrc
syntax on
colo peachpuff

set autoindent
set bs=2
set cindent
set directory=/tmp/
set expandtab
set incsearch
set list
set listchars=tab:..,trail:.
set noerrorbells
set nohlsearch
set novisualbell
set nowrap
set nu
set paste
set path=**
set ruler
set shiftwidth=2
set shortmess+=I
set showmatch
set smarttab
set tabstop=2
set ts=2
set wildmode=longest,list
set foldmethod=indent
set foldlevelstart=99
set complete=.,b,u,]
set spell spelllang=en_us
set nospell
set ignorecase
set smartcase
