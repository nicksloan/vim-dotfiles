set encoding=utf-8
set nocompatible
filetype off

call plug#begin('~/.config/nvim/plugged')
" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }

" Language server client (until Neovim 0.5 ships)
Plug 'natebosch/vim-lsc'

" QoL Improvements
Plug 'kien/rainbow_parentheses.vim'
Plug 'itchyny/lightline.vim' " Better status line
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'


call plug#end()


" GENERAL SETTINGS
""""""""""""""""""""""""""""""
filetype plugin indent on
syntax enable
set number
set clipboard=unnamed " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "  case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

"" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:→\ ,trail:·

"" Tabs & spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

"" General Code Folding
set foldmethod=indent
set foldlevel=99

"" Normal regexes
nnoremap / /\v
vnoremap / /\v

"" Change leader
let mapleader = ","
let g:mapleader = ","

"" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

"" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

"" Better window/tab navigation
nnoremap <Left> <C-W>h
nnoremap <Right> <C-W>l
nnoremap <Up> <C-W>k
nnoremap <Down> <C-W>j

nnoremap <S-Left> gT
nnoremap <S-Right> gt

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

"" Wildmenu completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                          " Cursed Java class files


" COLORSCHEME
""""""""""""""""""""""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark " or light
colorscheme dracula
au VimEnter * colorscheme dracula


" PLUGIN SETTINGS
""""""""""""""""""""""""""""""

"" Language server client settings
let g:lsc_server_commands = {
	\ 'python': {
		\ 'command': '~/.config/.pyls/bin/pyls',
		\ 'workspace_config': {'pyls': {'plugins': {'yapf': {'enabled': v:false}}}},
		\ 'suppress_stderr': v:true
	\ }
\ }
let g:lsc_auto_map = v:true

"" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" CtrlP Settings
let g:ctrlp_map = '<leader>s'
let g:ctrlp_cmd = 'CtrlP'

"" Lightline
" set t_Co=256
set noshowmode
let g:lightline = { 'colorscheme': 'one'}
