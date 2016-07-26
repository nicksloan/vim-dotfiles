set encoding=utf-8
set nocompatible               " be iMproved
filetype off                   " required!

call plug#begin('~/.config/nvim/plugged')

" Vundle help
""""""""""""""
" :PlugList          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugSearch(!) foo - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles


" VCS
Plug 'tpope/vim-fugitive'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" System
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/Gist.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'kien/rainbow_parentheses.vim'
Plug 'sophacles/vim-bundle-sparkup'

" Syntaxes and such.
Plug 'tpope/vim-cucumber'
Plug 'leshill/vim-json'
Plug 'tpope/vim-liquid'
Plug 'rodjek/vim-puppet'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'groenewege/vim-less'
Plug 'jcf/vim-latex'
Plug 'leafgarland/typescript-vim'
Plug 'markcornick/vim-terraform'
"Plug 'othree/html5.vim'

" Python bundles
Plug 'fs111/pydoc.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" Ruby specific
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'

" ctrlp instead
Plug 'git@github.com:kien/ctrlp.vim.git'

" Non-github repos
" Plug 'git://git.wincent.com/command-t.git'

" Fun, but not useful
Plug 'altercation/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
" Plug 'skammer/vim-css-color'
Plug 'mgutz/vim-colors'
Plug 'ehamberg/vim-cute-python'
Plug 'tpope/vim-speeddating'
Plug 'vim-airline/vim-airline'

call plug#end()

filetype plugin indent on     " required!

" Configurations
""""""""""""""""
"if has('gui_running')
"	set background=light
"else
	set background=dark
  set guifont=Source\ Code\ Pro:h15
"endif

" Wildmenu completion
"""""""""""""""""""""
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

" Save when losing focus
set autowriteall " Auto-save files when switching buffers or leaving vim.
au FocusLost * silent! :wa
au TabLeave * silent! :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Colours
set t_Co=256

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " or light

colorscheme OceanicNext
au VimEnter * colorscheme OceanicNext

" Basic
syntax enable
set number        " always show line numbers
"set hidden        " Allow un-saved buffers in background
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

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
endif

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:→\ ,trail:·

" Tabs & spaces
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set softtabstop=4
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" General Code Folding
""""""""""""""""""""""
set foldmethod=indent
set foldlevel=99

" Highlight VCS conflict markers
""""""""""""""""""""""""""""""""
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" I CAN HAZ NORMAL REGEXES?
"""""""""""""""""""""""""""
nnoremap / /\v
vnoremap / /\v


" General auto-commands
"""""""""""""""""""""""
autocmd FileType * setlocal colorcolumn=0
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Get rid of trailing whitespace highlighting in mutt.
autocmd FileType mail highlight clear ExtraWhitespace
autocmd FileType mail setlocal listchars=

" Crontab auto-commands
"""""""""""""""""""""""
autocmd FileType crontab setlocal backupcopy=yes

" Markdown auto-commands
""""""""""""""""""""""""
autocmd FileType markdown setlocal wrap linebreak nolist

" Ruby Configurations
"""""""""""""""""""""
autocmd FileType ruby set shiftwidth=2 tabstop=2

" PHP Configurations
""""""""""""""""""""
autocmd FileType php setlocal colorcolumn=100

" Python configurations
"""""""""""""""""""""""
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal colorcolumn=100
autocmd FileType python let g:syntastic_python_flake8_args='--max-line-length=99'
"autocmd FileType python let g:pep8_map='<F4>'
"autocmd FileType python map <buffer> <F4> :call Flake8()<CR>
"autocmd BufWritePost *.py call Flake8()

autocmd FileType html let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute', '<form> lacks "action" attribute']

" Coffeescript configurations
"""""""""""""""""""""""""""""
auto BufNewFile,BufReadPost *.coffee setlocal foldmethod=indent
au BufNewFile,BufReadPost *.coffee setlocal shiftwidth=2 expandtab

" Javascript configurations
"""""""""""""""""""""""""""
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Get jinja filetype selection working correctly for *.jinja.html files.
au BufNewFile,BufReadPost *.jinja.html setlocal filetype=htmljinja

au BufNewFile,BufReadPost *.sls setlocal filetype=yaml
au BufNewFile,BufReadPost *.sls setlocal shiftwidth=2 expandtab

" Make sure we hilight extra whitespace in the most annoying way possible.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Custom mappings
""""""""""""""""""

" Genral
noremap <silent> <F3> :QFix<CR>


" Change leader
let mapleader = ","
let g:mapleader = ","

" Get rid of search hilighting with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null


" Plugin configurations
""""""""""""""""""""""""

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 2
let g:gist_show_privates = 1

" TaskList
"map <leader>l <Plug>TaskList

" TagBar
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_autoshowtag = 1

" Command-T
nnoremap <Leader>t :CommandT<CR>

" NERDTree
nnoremap <Leader>g :NERDTreeToggle<CR>

" SnipMate
let g:snippets_dir = "~/.config/nvim/bundle/snipmate-snippets"

" Sparkup
let g:sparkupExecuteMapping = '<c-y>'
let g:sparkupNextMapping = '<c-k>'

" Double rainbow - What does it mean!?
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set laststatus=2
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_enable_baloons=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
