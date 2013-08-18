" .vimrc

syntax on
colo peachpuff

autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#CompleteRuby
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

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
set autoindent
set foldmethod=indent
set foldlevelstart=99
