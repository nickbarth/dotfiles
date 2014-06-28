" Vundle Setup
set nocompatible
filetype plugin indent on

" Plugins
silent! call pathogen#infect()
silent! call pathogen#helptags()

" Plugin Config
let g:UltiSnipsExpandTrigger="<c-j>"

" ignores
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe
set wildignore+=*.png,*.jpg,*.gif,*.eot,*.svg,*.ttf,*.woff,*/bower_components/*
set wildignore+=*.dat

" .vimrc
syntax on                      " Syntax highlighting on
color jellybeans               " My favorite color scheme

set autoindent                 " Copy indent from current line when starting a new line
set backspace=2                " Two character automatic placement after <
set copyindent                 " Copy the previous indentation on autoindenting
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
set nopaste                    " Snip plugins require nopaste
set path=**                    " Recursive path for easier ':find example.ext'
set rnu                        " Relative line numbering for easier movement
set nu                         " Show current line number
set noruler                    " Show the current row and column at the bottom right of the screen
set shiftwidth=2               " Two spaces inserted for indentation
set shortmess+=I               " No startup screen
set showmatch                  " Show matching bracket or parenthesis
set smartcase                  " Case sensitive search when case is used
set smarttab                   " Insert tab space on new line
set nospell                    " Spell check off by default
set tabstop=2                  " Tabs are 2 spaces
set wildmode=longest,list      " Longest then list completion mode
set virtualedit=               " No virtual spaces for ascii art
set lazyredraw                 " don't redraw when don't have to
set showtabline=0              " more space
set hidden                     " don't ask to save
set notimeout                  " no leader key timeout
set nostartofline              " don't to start of line on buffer switch

let mapleader = " "
let C_COMMAND_PANE=1 | let C_COMMAND='echo COMMAND'

nnoremap <leader><leader> <c-^>
nnoremap <leader>a :!aspell --dont-backup check %<CR><CR>
nnoremap <leader>c :exec "!tmux send-keys -t ".C_COMMAND_PANE." '".C_COMMAND."' Enter"<CR><CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :E<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>g :CtrlPBuffer<CR>
nnoremap <leader>i :tabs<CR>:echo bufnr('%') fugitive#statusline() expand('%:p')<CR>:
nnoremap <leader>j :bp<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>k :bn<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>l :buffers<CR>:echo bufnr('%') fugitive#statusline() expand('%:p')<CR>:b
nnoremap <leader>o :vnew +read!tree\ %:p:h<CR>
nnoremap <leader>p :CtrlPClearCache<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>r :source ~/.vimrc<CR>
nnoremap <leader>s :cw<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>v :sp<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>C :let C_COMMAND_PANE=1 \| let C_COMMAND=''<LEFT>
nnoremap <leader>J :cnext<CR>
nnoremap <leader>K :cprevious<CR>
nnoremap <leader>Q :qa!<CR>
nnoremap <leader>R :e ~/.vimrc<CR>
nnoremap <leader>W :x<CR>
set pastetoggle=<leader>~
nnoremap <leader>; :grep -Ri --exclude="tags" --exclude-dir="node_modules" --exclude-dir="git" --exclude="min" "" .<LEFT><LEFT><LEFT>

nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gg :Ggrep<Space>
nnoremap <space>gu :Dispatch! git pull<CR>
nnoremap <space>gp :Dispatch! git push<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gD :Gdiff ~

au BufRead,BufNewFile *.hx set filetype=haxe
