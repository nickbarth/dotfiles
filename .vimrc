" .vimrc
syntax on                      " syntax highlighting on
color jellybeans               " best color scheme

" config
let mapleader = " "            " set spacebar as leader key

set autoindent                 " copy indent from current line when starting a new line
set backspace=2                " two character automatic placement after <
set copyindent                 " copy the previous indentation on autoindenting
set cindent                    " c style indenting rules
set complete=.,b,u,]           " auto complete from current buff, loaded buffs, unloaded buffs, and tags
set directory=/tmp/            " hide backups away in the tmp directory
set nowritebackup              " no backup file while editing
set noswapfile                 " no swap files
set nobackup                   " no backup files
set foldlevelstart=99          " unfold all code folding
set foldnestmax=2              " easy zj / zk between methods
set ignorecase                 " ignore case while searching
set incsearch                  " search a word as its typed
set iskeyword+=-               " dashes as part of words
set laststatus=2               " lightLine bar
set lisp                       " auto complete words with dashes
set list                       " show whitespace
set listchars=tab:..,trail:.   " show whitespace as periods
set noerrorbells               " no beeping
set nohlsearch                 " no search highlighting
set novisualbell               " no screen flashing
set nowrap                     " no text wrapping
set paste                      " no plugin is worth changing this
set expandtab                  " expand tabs to spaces
set path=**                    " recursive path for easier ':find example.ext'
set nornu                      " hide relative line numbering for easier movement
set nonu                       " hide current line number
set ruler                      " show the current row and column at the bottom right of the screen
set shiftwidth=2               " two spaces inserted for indentation
set shortmess+=I               " no startup screen
set showmatch                  " show matching bracket or parenthesis
set smartcase                  " case sensitive search when case is used
set smarttab                   " insert tab space on new line
set nospell                    " spell check off by default
set tabstop=2                  " tabs are 2 spaces
set wildmode=longest,list      " longest then list completion mode
set virtualedit=               " no virtual spaces for ascii art
set lazyredraw                 " don't redraw when don't have to
set showtabline=0              " more space
set hidden                     " don't ask to save
set notimeout                  " no leader key timeout
set nostartofline              " don't to start of line on buffer switch
set t_Co=256                   " iterm2 terminal colors
set t_BE=                      " vim-multiple-cursor
set tags=tags                  " look for ctags in source directory

set nocompatible
filetype plugin indent on

" plugins
call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jpalardy/vim-slime'
  Plug 'sheerun/vim-polyglot'
  " Plug 'davidhalter/jedi-vim'
  Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jeetsukumaran/vim-pythonsense'
call plug#end()

" multi cursors
function! Multiple_cursors_after()
  " hack fix
  exe ':set expandtab'
  exe ':retab'
endfunction

" vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_command = "make"

function! Slime()
  let g:slime_command = input('Enter command: ')
endfunction

" lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" convenience
nnoremap <leader><leader> :e#<CR>
nnoremap <leader>~ :set invnumber<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>i :Commits<CR>
nnoremap <leader>j :bp<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>k :bn<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>; :Rg<CR>
nnoremap <leader>p :set invpaste paste?<cr>
nnoremap <leader>= :set expandtab<CR>:retab<cr>
nnoremap <leader>b :SlimeSend1 make build<CR>
nnoremap <leader>r :call slime#send(g:slime_command . "\r")<CR>
nnoremap <leader>R :call Slime()<CR>
vnoremap <leader>C :'<,'>!pbcopy<CR>u

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" git commands
nmap <leader>gc :Git commit<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gi :0Gclog<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>go :Git browse<CR>
nmap <leader>gp :!git push<CR>
nmap <leader>gs :Git<CR>
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>> <Plug>(GitGutterNextHunk)
nmap <leader><lt> <Plug>(GitGutterPrevHunk)

" defaults
au BufRead,BufNewFile *.p8 set filetype=lua
au filetype json       setl ts=2 softtabstop=2 shiftwidth=2 smarttab expandtab autoindent fileformat=unix
au filetype javascript setl ts=2 softtabstop=2 shiftwidth=2 smarttab expandtab autoindent fileformat=unix
au filetype python     setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype php        setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype css        setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype html       setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype lua        setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
