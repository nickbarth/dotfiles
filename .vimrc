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
set scrolloff=0                " no scroll offset
" set regexpengine=1           " regex engine sometimes needed for plugins
" set paste                    " no plugin is worth changing this

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
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
  " Plug 'shumphrey/fugitive-gitlab.vim'
  " Plug 'Ivo-Donchev/vim-react-goto-definition'
  " Plug 'davidhalter/jedi-vim'
  " Plug 'morhetz/gruvbox'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'jeetsukumaran/vim-pythonsense'
  " Plug 'dracula/vim', { 'name': 'dracula' }
  " Plug 'leafgarland/typescript-vim'
  " Plug 'yuezk/vim-js'
  " Plug 'maxmellon/vim-jsx-pretty'
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   Plug 'tpope/vim-rails'
   Plug 'tpope/vim-bundler'
   Plug 'tpope/vim-rake'
call plug#end()

" fzf
let g:fzf_history_dir = '~/.vim/fzf-history'

" copilot
colorscheme jellybeans
" autocmd BufWritePost * PrettierAsync

function! PipeToPbcopy()
    " Get the current file path
    let l:file_path = expand('%:p')

    " Pipe the entire file to pbcopy using cat
    if has('macunix')
        silent! execute '!cat ' . l:file_path . ' | pbcopy'
    elseif has('unix')
        silent! execute '!cat ' . l:file_path . ' | xclip -selection clipboard'
    endif
    redraw!
endfunction
command! -nargs=0 PipeToPbcopy call PipeToPbcopy()

function! FzfGitStatus()
  let files = systemlist("git status --short | awk '{print $2}' | grep -v '\/$'")
  call fzf#run(fzf#wrap({
  \ 'source': files,
  \ 'sink':   'e',
  \ 'options': '--multi --preview "git diff --color -- {} && bat --color=always {} | head -20"'
  \ }))
endfunction
command! -nargs=0 FzfGitStatus call FzfGitStatus()

" multi cursors reset
function! MultiCursorsFix()
  exe ':set expandtab'
  exe ':retab'
  redraw!
endfunction
command! -nargs=0 MultiCursorsFix call MultiCursorsFix()

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
nnoremap <leader>; :Rg<CR>
nnoremap <leader>= :set expandtab<CR>:retab<cr>
nnoremap <leader>I :Commits<CR>
nnoremap <leader>L :GFiles?<CR>
nnoremap <leader>R :call Slime()<CR>
nnoremap <leader>b :SlimeSend1 make build<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>i :BCommits<CR>
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>l :Buffers<CR>
nnoremap <leader>p :set invpaste paste?<cr>
nnoremap <leader>q :q!<CR>
nnoremap <leader>r :call slime#send(g:slime_command . "\r")<CR>
nnoremap <leader>/ :Lines<CR>
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>x :x<CR>
vnoremap <leader>C :'<,'>!pbcopy<CR>u
nnoremap <leader>P :PipeToPbcopy<CR>
nnoremap <leader>a :Rg <C-R><C-W><CR>

" copy paste
nnoremap YY :<C-u>execute "normal! ggyG"<CR>:call system('pbcopy', @")<CR>
nnoremap PP "+p
nnoremap GP ggVGd"+p

" Rails
nnoremap ,m :Emodel<CR>
nnoremap ,v :Eview<CR>
nnoremap ,c :Econtroller<CR>
nnoremap ,t :A<CR>
nnoremap ,T :Rake<CR>

" GoTo code navigation.
nmap <silent> ad <Plug>(coc-definition)
nmap <silent> ai <Plug>(coc-implementation)
nmap <silent> ar <Plug>(coc-references)
nmap <silent> ay <Plug>(coc-type-definition)

" git commands
nmap <leader>gs :FzfGitStatus<CR>
nmap <leader>ge :Gedit<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gc :!git commit<CR>
nmap <leader>gd :Gvdiffsplit<CR>
" :Git -- to returns from :0Gclog
nmap <leader>gl :0Gclog<CR>
nmap <leader>gi :0Gclog<CR>
nmap <leader>go :Git browse<CR>
nmap <leader>gp :!git push<CR>
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>] <Plug>(GitGutterNextHunk)
nmap <leader>[ <Plug>(GitGutterPrevHunk)
