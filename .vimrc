" .vimrc
syntax on                      " syntax highlighting on

" config
let mapleader = " "            " set spacebar as leader key

set regexpengine=0             " use vim regex engine
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
set nopaste                    " no pasting mode for space indents and plugins
set expandtab                  " expand tabs to spaces
set path=**                    " recursive path for easier ':find example.txt'
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
set lazyredraw                 " no redundant redraws
set showtabline=0              " more space
set hidden                     " don't ask to save
set notimeout                  " no leader key timeout
set nostartofline              " don't to start of line on buffer switch
set t_Co=256                   " iterm2 terminal colors
set t_BE=                      " vim-multiple-cursor
set tags=tags                  " look for ctags in source directory
set scrolloff=0                " no view scroll offset
set hidden                     " do not save buffers
set noconfirm                  " no confirmations

set nocompatible
filetype plugin indent on

" plugins
call plug#begin('~/.vim/plugged')
  Plug 'nanotech/jellybeans.vim', { 'name': 'jellybeans' }
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sleuth'
  " Plug 'tpope/vim-speeddating'
  " Plug 'tpope/vim-rails'
  " Plug 'tpope/vim-rake'
  " Plug 'tpope/vim-bundler'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jpalardy/vim-slime'
  Plug 'sheerun/vim-polyglot'
  Plug 'github/copilot.vim'
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install --frozen-lockfile --production',
    \ 'for': ['javascript', 'typescript', 'php', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'jceb/vim-orgmode'
call plug#end()

" plugin config
colorscheme jellybeans
" autocmd BufWritePost * PrettierAsync

" fzf
let g:fzf_history_dir = '~/.vim/fzf-history'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_command = "make"

function! SlimeCMD()
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
nnoremap <leader>` :set invpaste paste?<cr>
nnoremap <leader>= :set expandtab<CR>:retab<cr>
nnoremap <leader>a :Rg <C-R><C-W><CR>
nnoremap <leader>; :Rg<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>i :BCommits<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>p :Prettier<cr>
nnoremap <leader>q :q!<CR>
nnoremap <leader>R :call SlimeCMD()<CR>
nnoremap <leader>r :call slime#send(g:slime_command . "\r")<CR>
nnoremap <leader>/ :Lines<CR>
nnoremap <leader>t :let l = line('.')<CR>:tabnew %<CR>:exec l<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>

" default override
nnoremap <C-w>v :vsplit<CR><C-w>w
nnoremap <C-w>s :split<CR><C-w>w

" copy / paste
nnoremap YY :<C-u>execute "normal! ggyG"<CR>:call system('pbcopy', @")<CR>
nnoremap PP "+p
nnoremap GP ggVGd"+p

" rails
" nnoremap ,m :Emodel<CR>
" nnoremap ,v :Eview<CR>
" nnoremap ,c :Econtroller<CR>
" nnoremap ,r :Rake<CR>

" code navigation
nmap <silent> ad <Plug>(coc-definition)
nmap <silent> ai <Plug>(coc-implementation)
nmap <silent> ar <Plug>(coc-references)
nmap <silent> ay <Plug>(coc-type-definition)
nmap <leader>> :cn<CR>
nmap <leader>< :cp<CR>

" git commands
nmap <leader>gi :Git<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>ge :Gedit<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :Gvdiffsplit<CR>
nmap <leader>gl :0Gclog<CR>
nmap <leader>go :Git browse<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>] :GitGutterNextHunk<CR>
nmap <leader>[ :GitGutterPrevHunk<CR>
