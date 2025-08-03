""""""""""""""""""""""""""""""""""""""""""""

"ESSENTIALS"

""""""""""""""""""""""""""""""""""""""""""""

"Enable Syntax Highlighting"
syntax enable

"Enables True Color Support"
set termguicolors

"Allows Backspacing Over Everything In Insert Mode"
set backspace=indent,eol,start

"Configuring Conceal Colors"
hi Conceal cterm=bold ctermbg=NONE ctermfg=gray

"Number Of Visual Spaces Per Tab"
set tabstop=4

"Number Of Spaces In Tab When Editing"
set softtabstop=4

"Setting Shift Width"
set shiftwidth=4

"Tabs Are Spaces"
set expandtab

"Display Line Numbers"
set number

"Looks For The Ctags Index File"
set tags=tags

"Highlights Current Line"
set cursorline
hi CursorLine term=bold cterm=bold guibg=gray

"Loads Filetype-Specific Indent Files"
set autoindent
filetype plugin indent on

"Automatic Word Wrapping"
au filetype * set fo+=t
set textwidth=80

"Visual Autocomplete For Command Menu"
set wildmenu

"Highlights Matching [{()}]"
set showmatch

"Highlight Search Results"
set hlsearch

"Incremental Searches"
set incsearch

"Case Insensitive Search"
set ignorecase

"Start Diff Mode With Vertical Splits"
set diffopt=vertical

"Always Displays The Status Line"
set ls=2

"Display The Cursor Position On The Last Line Of The Screen Or In The Status Line Of A Window"
set ruler

"Hides Files Instead Of Closing Them"
set hidden

"Enables Mouse For Scrolling Only In Vim"
set mouse=a

"Automatic Closing Brackets"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"Maps Ctrl-c To Unhighlight Searches"
map <C-c> :noh<CR>

"Maps Ctrl-q To Close Current Buffer"
nnoremap <C-q> :bd<CR>

"Maps Ctrl-n To Next Buffer"
nnoremap <C-n> :bnext<CR>

"Maps Ctrl-m To Previous Buffer"
nnoremap <C-m> :bprev<CR>

"Maps Ctrl-j To Esc"
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

"Maps Ctrl-p To Pastetoggle"
set pastetoggle=<C-p>

"Maps Space To Leader"
let mapleader="\<Space>"

"Maps Leader-i To gg=G"
nnoremap <Leader>i gg=G :w<CR>

"Maps Leader-t To FZF"
nnoremap <Leader>t :FZF<CR>

"Need to install https://github.com/ggreer/the_silver_searcher"
"Maps Leader-f To Ag"
nnoremap <Leader>f :Ag<Space>

"Maps Leader-n To NERDTree"
nnoremap <Leader>n :NERDTree<CR>

"Maps Leader-] To Tagbar"
nnoremap <Leader>] :Tagbar<CR>

"Maps Leader-q To SyntasticToggleMode"
nnoremap <Leader>q :SyntasticToggleMode<CR>

"Maps Leader-[ To SyntasticCheck"
nnoremap <Leader>[ :SyntasticCheck<CR>

"Maps Leader-l To LLPStartPreview"
nnoremap <Leader>l :LLPStartPreview<CR>

"Maps Leader-g To Gblame"
nnoremap <Leader>g :Git blame<CR>

"Plugin Section"

"Installation"
"Check Vim-Plug Installation Guide"

"Use PlugInstall To Install Plugins"
"Use PlugUpdate To Update Plugins"

call plug#begin()

"FZF Plugin"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"NERDTree Plugin"
"NERDTree Will Be Loaded On The First Invocation Of NERDTreeToggle Command"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"Asynchronous Lint Engine Plugin"
Plug 'https://github.com/dense-analysis/ale'

"Polyglot Plugin"
Plug 'https://github.com/sheerun/vim-polyglot'

"Surround Plugin"
Plug 'https://github.com/tpope/vim-surround'

"IndentLine Plugin"
Plug 'https://github.com/yggdroot/indentline'

"Fugitive Plugin"
Plug 'https://github.com/tpope/vim-fugitive'

"Gitgutter Plugin"
Plug 'https://github.com/airblade/vim-gitgutter'

"Gutentags Plugin"
"Need to install ctags"
Plug 'https://github.com/ludovicchabant/vim-gutentags'

"Tagbar Plugin"
Plug 'https://github.com/preservim/tagbar'

"Catppuccin Plugin"
Plug 'https://github.com/catppuccin/vim', { 'as': 'catppuccin' }

"Airline Plugin"
Plug 'https://github.com/vim-airline/vim-airline'

"Airline-Themes Plugin"
Plug 'https://github.com/vim-airline/vim-airline-themes'

"Latex-Live-Preview Plugin"
Plug 'https://github.com/xuhdev/vim-latex-live-preview'

"Black Plugin"
Plug 'https://github.com/psf/black'

call plug#end()

"Configuring NERDTree"
hi Directory ctermfg=darkcyan
let NERDTreeShowHidden=1

"Configuring Asynchronous Lint Engine"
highlight ALEError ctermbg=red
highlight ALEWarning ctermbg=red

"Configuring IndentLine"
let g:indentLine_enabled=1
let g:indentLine_char='|'
let g:indentLine_setColors=0

"Configuring Gutentags"
set statusline+=%{gutentags#statusline()}

"Configuring Vim-Airline"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

"Configuring Vim-Airline-Themes"
let g:airline_theme = 'catppuccin_mocha'

"Setting Color Scheme"
colorscheme catppuccin_mocha

"Configuring Vim-Latex-Live-Preview"
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer='open -a Preview'

"Configuring Asynchronous Lint Engine"
let g:ale_linters={'python': ['flake8']}
let g:ale_python_flake8_options='--max-line-length=80'

"Configuring Black"
let g:black_linelength=80
