"Get out of VI's compatible mode..
set nocompatible

"Set encoding
"default file encoding
set encoding=utf-8
"supported file encodings
set fileencodings=utf-8,chinese,big5

"Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

"Enable syntax hl
syntax on

" indent
set cindent
"set autoindent
"set smartindent

"Wrap lines
set wrap

" tab
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

"Show line number
set number

" search
"set hlsearch
set ignorecase
"set  incsearch
set wrapscan

" background
set background="dark"

"show matching bracets
set showmatch

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" set supported color to 256
" choose a colorscheme
set t_Co=256
colorscheme ron

" for 80-column style
set textwidth=80
set wrapmargin=0
set formatoptions+=t
if exists('+colorcolumn')
      set colorcolumn=80
  else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
        "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        "match OverLength /\%81v.\+/
endif
