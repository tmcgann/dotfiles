" VIM Configuration - Taylor McGann

set nocompatible             " be iMproved, required for Vundle
filetype off                 " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Wrapper for Git commands: https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" JavaScript syntax: https://github.com/othree/yajs.vim
"Plugin 'othree/yajs.vim'

" HTML syntax: https://github.com/othree/html5.vim
"Plugin 'othree/html5.vim'

" TypeScript syntax: https://github.com/HerringtonDarkholme/yats.vim/
"Plugin 'HerringtonDarkholme/yats.vim'

" Polyglot syntax: https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

" Themes
" OceanicNext: https://github.com/mhartington/oceanic-next
Plugin 'mhartington/oceanic-next'

" All of your Plugins must be added before the following line
call vundle#end()            " required for Vundle
filetype plugin indent on    " required for Vundle

"""""""""""""""
""" Display """
"""""""""""""""

" Enable syntax highlighting
syntax on

" Not sure what this does :)
if (has("termguicolors"))
  set termguicolors
endif

" Set Solarized theme
"let g:solarized_termtrans=1
"set background=dark
"colorscheme solarized

" Set up Oceanic Next theme
"let g:base16_shell_path=base16-builder/output/shell/
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set background=dark
colorscheme OceanicNext

" Set font
set guifont=menlo:h12
set antialias

" Show the filename in the window titlebar
set title

" Enable line numbers
set number

" Show the cursor position
set ruler

" Highlight current line
"set cursorline

" Set no underline for line highlight
highlight CursorLine cterm=none

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Make tabs as wide as four spaces
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Enable the toolbar
"set guioptions=T

""""""""""""""
""" Search """
""""""""""""""

" Ignore case of searches
set ignorecase

" Uppercase characters in search terms are case sensitive
set smartcase

" Highlight search results
set hlsearch

" Highlight search results as pattern is typed
set incsearch

""""""""""""
""" Misc """
""""""""""""

" Make Vim more useful; cancels compatibility with Vi
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
"let mapleader=","

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Respect modeline in files
set modeline
set modelines=4

" Don’t add empty newlines at the end of files
set binary
set noeol

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif

" Start scrolling three lines before the horizontal window border
"set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Save a file as root (,W)
"noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
