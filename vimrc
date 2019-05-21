set nocompatible

" Plugins ====================================================================

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'ivoputzer/vim-colors-flatland'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" More plugins - Remove " to enable them
" Plugin 'tpope/vim-rails'
" Plug 'scrooloose/syntastic'
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'kana/vim-textobj-user'
" Plug 'Julian/vim-textobj-variable-segment'
" Plug 'sjl/gundo.vim'

" Local bundles ==============================================================

if filereadable(expand("~/.vimrc.bundles.local"))
    source ~/.vimrc.bundles.local
endif

call vundle#end()

" General Config =============================================================

set autoread
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set hidden
set history=1000
set laststatus=2
set lazyredraw
set modelines=0
set number
set numberwidth=5
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set title
set ttyfast
set visualbell
set clipboard=unnamed
set colorcolumn=80

syntax on

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Search Settings ============================================================

set incsearch
set hlsearch
set ignorecase
set smartcase

" Persistent undo and backups ================================================

if has('persistent_undo')
    set undodir=~/.vim/tmp/undo
    set undoreload=10000
    set undofile
endif

set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set backup

" Indentation ================================================================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set shiftround

filetype plugin indent on

set list listchars=tab:»·,trail:·
set showbreak=↪

" Completion =================================================================

set wildmode=list:longest
set wildmenu

" Colors =====================================================================

syntax on
set background=dark
set t_Co=256
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  let g:solarized_termcolors=256
  let g:solarized_visibility="low"
  colorscheme solarized
endif

" Scrolling ==================================================================

set scrolloff=3
set sidescrolloff=15
set sidescroll=1

" Convenience mappings =======================================================

" Make capitals behave
nnoremap D d$
nnoremap Y y$

" It's 2015.
noremap j gj
noremap k gk

" Easy paragraph formatting
nnoremap Q gqip

" Easy tab navigation
map <S-H> gT
map <S-L> gt

" Substitute
nnoremap <leader>s :%s//<left>

" Clear search highlighting
map <C-l> :nohlsearch<CR>

" Fuck you, help key
noremap  <F1> <NOP>
inoremap <F1> <NOP>

" Keep yo hands on the keyboard
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Change Working Directory to that of the current file
cmap cwd lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :tabe $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Autocommands ===============================================================

if has('autocmd')

  set omnifunc=syntaxcomplete#Complete

  augroup vimrcEx
  au!

  " Remove any trailing whitespace that is in the file
  autocmd BufWrite * if ! &bin | :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')) | endif

  augroup END

endif " has('autocmd')

" Plugin settings ============================================================

" Matchit.vim

runtime macros/matchit.vim

" NERD Tree

map <C-e> :NERDTreeToggle<CR>

let NERDTreeHighlightCursorline=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 40

" Supertab

let g:SuperTabLongestHighlight = 1

" Ack

map <leader>a :Ack!<space>

" CtrlP

let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = ['tag']

" Signify

let g:signify_vcs_list = ['git']

" Airline

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep='❯'
let g:airline_right_alt_sep='❮'
let g:airline_symbols.branch = '⚡'

" Local vimrc ================================================================

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
com! FormatJSON %!python -m json.tool
