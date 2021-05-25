call plug#begin('~/.local/share/nvim/plugged')
  " Git integration
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin'

  " File navigation
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
  Plug 'junegunn/fzf.vim'
  Plug 'mbbill/undotree'

  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'NLKNguyen/papercolor-theme'
  
  " Code visualisation
  Plug 'Yggdroot/indentLine'
  Plug 'sheerun/vim-polyglot'

  " Syntax check
  Plug 'w0rp/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'hashivim/vim-terraform'
  Plug 'stephpy/vim-yaml'

  " Code formatter
  Plug 'jiangmiao/auto-pairs'
  Plug 'sbdchd/neoformat'
  Plug 'tmhedberg/SimpylFold'

  " Coding
  Plug 'scrooloose/nerdcommenter'
  Plug 'ludovicchabant/vim-gutentags'

  " Haskell
  Plug 'neovimhaskell/haskell-vim'
  Plug 'mpickering/hlint-refactor-vim'
  Plug 'alx741/vim-hindent'
  " Autocomplete
  Plug 'zchee/deoplete-jedi'
  Plug 'davidhalter/jedi-vim'

  " Theme
  Plug 'morhetz/gruvbox'

  " Utils
  Plug 'machakann/vim-highlightedyank'
call plug#end()

syntax on
set mouse=a
colorscheme PaperColor
"set background=light
set background=dark
let g:gruvbox_contrast_light = 'hard'

filetype plugin indent on
set encoding=utf-8                  " use utf-8 encoding
let mapleader=","                   " map leader to ,
set clipboard+=unnamedplus          " share clipboard
set backspace=indent,eol,start      " enables backspacing
inoremap jk <ESC>                   " remap the exit button ESC too far from home row

" TAB configuration
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set expandtab                       " tabs are spaces
set shiftwidth=4                    " autoindent to 4 spaces
set nowrap                          " do not break lines

" UI Config
set number                          " show line number
set relativenumber                  " relative line numbers
set showcmd                         " show last command in botom bar
set cursorline                      " highlight the selected line
set cursorcolumn                    " highlight the selected column
filetype indent on                  " load filetype-specific indent files from ~/.vim/indent/*
set wildmenu                        " visual autocomplete for command menu
set lazyredraw                      " redraw only when necessary, optimization
set showmatch                       " highlight matching [{()}]
set splitbelow                      " open split below current window
set splitright                      " open vertical split at the right of current window
" Navigate through splits with one combo
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>



" Searching
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches

" turn off search highlights
nnoremap <leader><space> :nohlsearch<CR>


" Folding
set foldenable                      " enable folding
set foldlevelstart=10               " open most folds by default
set foldnestmax=10                  " 10 nested fold max
" space open/close folds
nnoremap <space> za
set foldmethod=indent
let g:SimpylFold_docstring_preview = 1   " Show docstring preview

" Movement Configuration
" move vertically by visual line
nnoremap j gj
nnoremap k gk


" Tagging
"set tags=./tags,tags;$HOME

" NERDTree Configuration
" Start NERDTree automatically when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree when the target is a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Open NERDTree with CTRL-n
map <C-n> :NERDTreeToggle<CR>
" Close NERDTree when it is the last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let NERDTreeQuitOnOpen = 1          " automatically close NERDTree when open file
let NERDTreeAutoDeleteBuffer = 1    " automatically delete buffer when file removed with NERDTree
let NERDTreeMinimalUI = 1           " disable help
let NERDTreeDirArrows = 1           " show directory arrows



" Tags
"set tags=.tags
"nnoremap <F8> :TagbarToggle<CR>



" Ack configuration
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg<CR>

" Undo tree
nnoremap <F5> :UndotreeToggle<cr>


" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:hindent_indent_size = 4
let g:hindent_line_length = 100
let g:hindent_command = "stack exec -- hindent"


" Python
let g:python3_host_prog = '~/neovim3/bin/neovim3/bin/python'
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_haskell_enabled_markers = ['hlint']


" ALE configuration
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
    \ 'python': ['flake8', 'pylint'],
    \ 'haskell': ['hlint', 'ghc']
    \}
let g:ale_haskell_ghc_options = '-fn0-code -v0 -isrc'
let g:ale_fixers = {
    \   'python': ['yapf']
    \}
let g:ale_fix_on_save = 1
" ALE Configuration
nnoremap <leader><C-l> :ALEFix<CR>

let g:coc_global_extensions = ['coc-pyright']


"
" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

