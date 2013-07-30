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

au FileType js set omnifunc=javascriptcomplete#CompleteJS
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType rb set omnifunc=rubycomplete#CompleteRuby
au FileType py set omnifunc=pythoncomplete#CompletePython
