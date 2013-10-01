" .vimrc
syntax on                      " Syntax highlighting on
color peachpuff                " My favorite color scheme

set autoindent                 " Copy indent from current line when starting a new line
set backspace=2                " Two character automatic placement after <
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
set paste                      " Always be in paste mode in insert
set path=**                    " Recursive path for easier ':find example.ext'
set rnu                        " Relative line numbering for easier movement
set nu                         " Show current line number
set ruler                      " Show the current row and column at the bottom right of the screen
set shiftwidth=2               " Two spaces inserted for indentation
set shortmess+=I               " No startup screen
set showmatch                  " Show matching bracket or parenthesis
set smartcase                  " Case sensitive search when case is used
set smarttab                   " Insert tab space on new line
set spelllang=en_us            " Sets dictionary
set nospell                    " Spell check off by default
set showtabline=2              " Always show tabline
set tabline=%!TabLine()        " Show numbered tabline
set tabstop=2                  " Tabs are 2 spaces
set wildmode=longest,list      " Longest then list completion mode
set virtualedit=all            " Virtual spaces for ascii art

function TabLine()
  let s = ''
  let t = tabpagenr()
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let s .= '%' . i . 'T'
    let s .= (i == t ? '%1*' : '%2*')
    let s .= ' %*'
    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
    let file = bufname(buflist[winnr - 1])
    let file = fnamemodify(file, ':p:t')
    if file == ''
      let file = '[No Name]'
    endif
    let s .= i . ' ' . file . ' '
    let i = i + 1
  endwhile
  let s .= '%T%#TabLineFill#%='
  let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
  return s
endfunction
