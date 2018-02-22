"Start dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim')
  call dein#begin('~/.config/nvim')

  " Let dein manage dein
  call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deol.nvim')

  " Syntax highlighting 
  call dein#add('sheerun/vim-polyglot')

  " Fancy arrow status
  call dein#add('vim-airline/vim-airline')

  " lint
  call dein#add('w0rp/ale')

  " Theme
  call dein#add('joshdick/onedark.vim')

  " NERDTtree toggled with <leader>f 
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"  call dein#install()
" endif

"End dein Scripts-------------------------

""Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" The color scheme loaded above
let g:airline_theme='onedark'
colorscheme onedark

let mapleader = ";"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline_powerline_fonts = 1
let g:onedark_terminal_italics = 1 
let g:ale_sign_column_always = 1
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'], 'json': ['prettier'] }
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0 
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore=['\.git$[[dir]]', 'node_modules$[[dir]]']

" basic settings
set encoding=utf8
set title
set number
set history=1024
set showcmd
set nobackup 
set autoread
set undofile
au FocusGained,BufEnter * :silent! !

" indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set copyindent
set colorcolumn=80

let &showbreak="↪ "

" Splits
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
set splitbelow
set splitright

" key bindings
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <Leader>t :split term://zsh<Enter>i

" Terminal
:tnoremap <Esc> <C-\><C-n>
