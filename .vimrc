set nocompatible
filetype plugin indent on

" Plugins
silent! call pathogen#infect()
silent! call pathogen#helptags()

" config
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" ignores
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe
set wildignore+=*.png,*.jpg,*.gif,*.eot,*.svg,*.ttf,*.woff,*/bower_components/*
set wildignore+=*.dat

" .vimrc
syntax on                      " Syntax highlighting on
color jellybeans               " My favorite color scheme

let mapleader = " "            " Set Spacebar as leader key

set autoindent                 " Copy indent from current line when starting a new line
set backspace=2                " Two character automatic placement after <
set copyindent                 " Copy the previous indentation on autoindenting
set cindent                    " C style indenting rules
set complete=.,b,u,]           " Auto complete from current buff, loaded buffs, unloaded buffs, and tags
set directory=/tmp/            " Hide backups away in the tmp directory
set nowritebackup              " No backup file while editing
set noswapfile                 " No swap files
set nobackup                   " No backup files
set expandtab                  " Expand tabs to spaces
set foldlevelstart=99          " Unfold all code folding
set foldnestmax=2              " Easy zj / zk between methods         
set foldmethod=indent          " Cold folding mode set to indents
set ignorecase                 " Ignore case while searching
set incsearch                  " Search a word as its typed
set iskeyword+=-               " Dashes as part of words
set lisp                       " Auto complete words with dashes
set list                       " Show whitespace
set listchars=tab:..,trail:.   " Show whitespace as periods
set noerrorbells               " No beeping
set nohlsearch                 " No search highlighting
set novisualbell               " No screen flashing
set nowrap                     " No text wrapping
set paste                      " No plugin is worth changing this
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

" Convenience Commands
nnoremap <leader><leader> <c-^>
nnoremap <leader>~ :set invnumber<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>j :bp<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>k :bn<CR>:echo bufnr('%') expand('%:p')<CR>
nnoremap <leader>l :ls<CR>:echo bufnr('%') fugitive#statusline() expand('%:p')<CR>:b
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>q :q!<CR>
" nnoremap <leader>r :Dispatch! tmux send-key -t right "echo make" C-m<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>; :grep -Ri --exclude="tags" --exclude-dir="node_modules" --exclude-dir="git" --exclude="min" "" .<LEFT><LEFT><LEFT>

" Git Commands
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gg :Ggrep<Space>
nnoremap <leader>gu :Dispatch! git pull --rebase<CR>
nnoremap <leader>gp :Dispatch! git push<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR><CR>

au BufRead,BufNewFile *.hx set filetype=haxe
au BufNewFile,BufRead *.py setl ts=4 softtabstop=4 shiftwidth=4 smarttab expandtab autoindent fileformat=unix
au BufNewFile,BufRead *.html setfiletype=htmldjango
