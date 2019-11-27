" .vimrc
syntax on                      " syntax highlighting on
color jellybeans               " best color scheme

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
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'jpalardy/vim-slime'
  Plug 'jwalton512/vim-blade'
  Plug 'itchyny/lightline.vim'
  Plug 'pseewald/vim-anyfold'
  Plug 'ajh17/VimCompletesMe'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'airblade/vim-gitgutter'
  " Plug 'fatih/vim-go'
call plug#end()

" config

" anyfold
filetype plugin indent on
autocmd Filetype * AnyFoldActivate

" vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
"  <C-c>v - config slime
"  <C-a>' - check pane #
"  <C-a>: resize -t 1 -y 10 # set pane height

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

" ctrlp
let g:ctrlp_switch_buffer = "t"
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe
set wildignore+=*.png,*.jpg,*.gif,*.eot,*.svg,*.ttf,*.woff,*.dat,*.map,*.min.*
set wildignore+=*/bower_components/*,*/vendor/*,*/dist/*,*/storage/*,*/static/*

if executable('ack')
  " ack search eg :Ack --php echo
  set grepprg=ack\ -s\ -H\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  command -nargs=+ -complete=file -bar Ack silent! grep! <args>|cwindow|redraw!
endif

" convenience
nnoremap <leader><leader> :e#<CR>
nnoremap <leader>~ :set invnumber<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>j :bp<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>k :bn<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>l :CtrlPBuffer<CR>
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>; :Ack<Space>
nnoremap <leader>p :set invpaste paste?<cr>
nnoremap <leader>= :retab<cr>
nnoremap <leader>b :SlimeSend1 make build<CR>
nnoremap <leader>r :SlimeSend1 go run .<CR>

" git commands
" nmap <leader>ga :Git add %:p<CR><CR>
nmap <leader>gb :Git branch<Space>
nmap <leader>gc :Gcommit -v -q<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>ge :Gedit<CR>
nmap <leader>gl :silent! Glog<CR>:bot copen<CR>
nmap <leader>gi :GitGutterToggle<CR>
nmap <leader>gm :Gmove<Space>
nmap <leader>go :Git checkout<Space>
nmap <leader>gg :Ggrep<Space>
nmap <leader>gpu :!git push<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gw :Gwrite<CR><CR>
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)<CR>
nmap <C-m> <Plug>(GitGutterNextHunk)
nmap <C-,> <Plug>(GitGutterPrevHunk)

" defaults
au BufRead,BufNewFile *.p8 set filetype=lua
au filetype json setl ts=2 softtabstop=2 shiftwidth=2 smarttab expandtab autoindent fileformat=unix
au filetype javascript setl ts=2 softtabstop=2 shiftwidth=2 smarttab expandtab autoindent fileformat=unix
au filetype python setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype php setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype css setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype scss setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype html setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au filetype lua setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
