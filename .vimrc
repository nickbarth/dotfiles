" .vimrc
syntax on                      " enable syntax highlighting

" General Configuration
let mapleader = " "            " set spacebar as leader key

set regexpengine=0             " use vim's regex engine
set autoindent                 " auto-indent new lines based on the current line
set copyindent                 " copy previous indentation for auto-indenting
set cindent                    " apply c-style indentation rules
set complete=.,b,u             " autocomplete from current buffer, loaded/unloaded buffers
set directory=/tmp/            " store swap files in /tmp/ directory
set nowritebackup              " disable backup files during editing
set noswapfile                 " disable swap files
set nobackup                   " disable backup files
set foldlevelstart=99          " unfold all code by default
set foldnestmax=2              " allow folding up to 2 levels deep
set ignorecase                 " ignore case in searches
set incsearch                  " incremental search (search as you type)
set iskeyword+=-               " treat dashes as part of words
set laststatus=2               " always show the status line
set list                       " display whitespace characters
set listchars=tab:..,trail:.   " show tabs and trailing spaces as periods
set noerrorbells               " disable beeping
set nohlsearch                 " disable search highlighting
set novisualbell               " disable screen flashing
set nowrap                     " disable line wrapping
set expandtab                  " convert tabs to spaces
set path=**                    " enable recursive path searching with :find
set nornu                      " disable relative line numbering
set nonu                       " disable absolute line numbering
set ruler                      " show row and column in the status line
set shiftwidth=2               " use 2 spaces for indentation
set shortmess+=I               " skip the startup message
set showmatch                  " highlight matching brackets and parentheses
set smartcase                  " enable case-sensitive search when uppercase letters are used
set smarttab                   " adjust tab spaces on new lines
set nospell                    " disable spell check by default
set tabstop=2                  " set tab width to 2 spaces
set wildmode=longest,list      " command-line completion mode
set virtualedit=               " disable virtual editing (no cursor beyond the end of the line)
set lazyredraw                 " redraw only when necessary
set showtabline=0              " hide the tab line for more space
set hidden                     " allow buffer switching without saving
set notimeout                  " disable timeout for leader key sequences
set nostartofline              " retain cursor position on buffer switch
set t_Co=256                   " enable 256-color support in the terminal
set t_BE=                      " fix for vim-multiple-cursor
set tags=tags                  " look for ctags in the current directory
set scrolloff=0                " no vertical scroll offset

set nocompatible               " disable vi compatibility
filetype plugin indent on      " enable filetype-specific plugins and indentation

" plugins
call plug#begin('~/.vim/plugged')
  Plug 'nanotech/jellybeans.vim'                          " A colorful, high-contrast color scheme
  Plug 'tpope/vim-commentary'                             " comment out code with `gcc` and `gc`
  Plug 'tpope/vim-fugitive'                               " Git in Vim
  Plug 'tpope/vim-repeat'                                 " repeating more with the `.` command
  Plug 'tpope/vim-rhubarb'                                " `:Gbrowse` files on Github
  Plug 'tpope/vim-surround'                               " change surrounding characters (like quotes, parentheses)
  Plug 'tpope/vim-sleuth'                                 " Automatically adjusts `shiftwidth` and `expandtab` based on file
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fuzzy finder for Vim
  Plug 'junegunn/fzf.vim'                                 " fuzzier fuzzy finding
  Plug 'airblade/vim-gitgutter'                           " Shows a Git diff in the gutter (sign column) of Vim
  Plug 'terryma/vim-multiple-cursors'                     " multiple cursors for Vim
  Plug 'jpalardy/vim-slime'                               " Send text from Vim to a REPL
  Plug 'sheerun/vim-polyglot'                             " language packs for syntax highlighting

  " Plug 'prettier/vim-prettier', { 'do': 'yarn install --production' } " Format code
  " Plug 'github/copilot.vim'                                           " Generate Code
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}                     " LSP Complete Code
call plug#end()

" plugin config
colorscheme jellybeans " enable the best color scheme

" - fzf
let g:fzf_history_dir = '~/.vim/fzf-history'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --line-number --no-heading --color=always".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" - slime
function! SlimeCMD()
  let g:slime_command = input('Enter command: ')
endfunction

let g:slime_target = "tmux"
let g:slime_command = "make"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" - prettier
" autocmd BufWritePost * PrettierAsync

" convenience
nn <leader><leader> :e#<CR>          " switch to the previously edited buffer
nn <leader>~ :set invnumber<CR>      " toggle line numbers
nn <leader>a :Rg <C-R><C-W><CR>      " search for the word under the cursor using ripgrep
nn <leader>; :Rg<CR>                 " open ripgrep search prompt
nn <leader>e :Explore<CR>            " open file explorer
nn <leader>f :Files<CR>              " open file finder
nn <leader>i :BCommits<CR>           " show buffer commits
nn <leader>l :Buffers<CR>            " list open buffers
nn <leader>d :bd<CR>                 " close current buffer
nn <leader>j :bn<CR>                 " switch to next buffer
nn <leader>k :bp<CR>                 " switch to previous buffer
nn <leader>p :set invpaste paste?<cr>" toggle paste mode
nn <leader>P :Prettier<cr>           " format code with prettier
nn <leader>q :q!<CR>                 " quit without saving
nn <leader>R :call SlimeCMD()<CR>    " execute a custom slime command
nn <leader>/ :Lines<CR>              " open fuzzy search for lines in the current buffer
nn <leader>t :tabe %<CR>             " open the current file in a new tab
nn <leader>w :w<CR>                  " save the current buffer
nn <leader>x :x<CR>                  " save and close the current buffer
nn <leader>> :cn<CR>                 " jump to the next item in the quickfix list
nn <leader>< :cp<CR>                 " jump to the previous item in the quickfix list

nn <leader>= :set expandtab<CR>:retab<cr>                 " convert tabs to spaces and reformat existing lines
nn <leader>r :call slime#send(g:slime_command . "\r")<CR> " send a command to the slime repl

" copy & paste
nn YY :<C-u>execute "normal! ggyG"<CR>:call system('pbcopy', @")<CR> " copy entire buffer
nn PP "+p                                                            " paste from clipboard
nn GP ggVGd"+p                                                       " replace buffer with clipboard

" conquer of completion
nn <silent> ad <Plug>(coc-definition)      " goto definition
nn <silent> ai <Plug>(coc-implementation)  " goto implementation
nn <silent> ar <Plug>(coc-references)      " find references
nn <silent> ay <Plug>(coc-type-definition) " goto type definition

" Git Commands
nn <leader>gi :Git<CR>                   " open git status
nn <leader>gs :GFiles?<CR>               " open fuzzy search for git files
nn <leader>gc :Git commit<CR>            " commit changes
nn <leader>ge :Gedit<CR>                 " edit a file from the git index
nn <leader>gr :Gread<CR>                 " read file from the git index
nn <leader>gw :Gwrite<CR>                " write buffer to the git index
nn <leader>gd :Gvdiffsplit<CR>           " open a git diff in a vertical split
nn <leader>gl :0Gclog<CR>                " show the git log for the current file
nn <leader>go :Git browse<CR>            " open the file in github
nn <leader>gp :Git push<CR>              " push commits to the remote repository
nn <leader>ga <Plug>(GitGutterStageHunk) " stage the current hunk
nn <leader>gu <Plug>(GitGutterUndoHunk)  " undo the last staged hunk
nn <leader>] :GitGutterNextHunk<CR>      " jump to the next git hunk
nn <leader>[ :GitGutterPrevHunk<CR>      " jump to the previous git hunk
