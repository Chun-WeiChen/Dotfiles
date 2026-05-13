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

"Highlights Current Line"
set cursorline
hi CursorLine term=bold cterm=bold guibg=gray

"Loads Filetype-Specific Indent Files"
set autoindent
filetype plugin indent on

"Automatic Word Wrapping"
set wrap
set linebreak
set breakindent

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

"Need to install Ripgrep"
"Maps Leader-f To Rg"
nnoremap <Leader>f :Rg<Space>

"Maps Leader-F To Search Word Under Cursor"
nnoremap <Leader>F :Rg <C-r><C-w><CR>

"Maps Leader-l To Browse All Ctags Symbols With FZF"
nnoremap <Leader>l :Tags<CR>

"Maps Leader-L to Browse Tags In Current File Only"
nnoremap <Leader>L :BTags<CR>

"Maps Leader-n To NERDTree"
nnoremap <Leader>n :NERDTree<CR>

"Maps Leader-b To Tagbar"
nnoremap <Leader>b :Tagbar<CR>

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

"Rooter Plugin"
Plug 'https://github.com/airblade/vim-rooter'

"Vim LSP Plugin"
Plug 'https://github.com/prabirshrestha/vim-lsp'

"Vim LSP Settings Plugin"
Plug 'https://github.com/mattn/vim-lsp-settings'

"Asyncomplete Plugin"
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'

"Asyncomplete LSP Plugin"
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'

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

call plug#end()

"Configuring NERDTree"
hi Directory ctermfg=darkcyan
let NERDTreeShowHidden=1

"Configuring Rooter"
let g:rooter_patterns = ['.git', 'pyproject.toml', 'package.json', 'Cargo.toml', 'setup.py']

"Configuring Asynchronous Lint Engine"
highlight ALEError ctermbg=red
highlight ALEWarning ctermbg=red
let g:ale_linters_explicit = 1
let g:ale_linters = {'python': ['ruff']}
let g:ale_fixers = {'python': ['ruff', 'ruff_format']}
let g:ale_fix_on_save = 1
let g:ale_python_ruff_executable = 'ruff'
let g:ale_virtualenv_dir_names = ['.venv', 'venv', '.env', 'env']
let g:ale_python_ruff_options = '--line-length 150'
let g:ale_python_ruff_format_options = '--line-length 150'

"Configuring Vim-LSP"
"This function runs automatically when a language server attaches to a buffer"
"Using a function + augroup ensures mappings are only active where LSP is running"
function! s:on_lsp_buffer_enabled() abort
    "Go to the definition of the symbol under the cursor"
    nmap <buffer> <Leader>d <Plug>(lsp-definition)
    "Show documentation/type signature for the symbol under the cursor"
    nmap <buffer> <Leader>p <Plug>(lsp-hover)
endfunction
"augroup isolates these autocommands so re-sourcing your vimrc"
"Doesn't register duplicate handlers (au! clears the group first)"
augroup lsp_install
    au!
    "Trigger the function above whenever LSP becomes active in a buffer"
    au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"Configuring Vim-LSP-Settings"
"Ruff handles lint/style - pylsp does intellisense only"
let g:lsp_settings = {'pylsp-all': {'workspace_config': {'pylsp': {'plugins': {}}}}}
let s:pylsp_plugins = g:lsp_settings['pylsp-all'].workspace_config.pylsp.plugins
let s:pylsp_plugins.pycodestyle = {'enabled': v:false}
let s:pylsp_plugins.pyflakes    = {'enabled': v:false}
let s:pylsp_plugins.mccabe      = {'enabled': v:false}

"Configuring IndentLine"
let g:indentLine_enabled=1
let g:indentLine_char='|'
let g:indentLine_setColors=0

"Configuring Gutentags"
let g:gutentags_modules=['ctags']

"Configuring Vim-Airline"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

"Configuring Vim-Airline-Themes"
let g:airline_theme='catppuccin_mocha'

"Setting Color Scheme"
colorscheme catppuccin_mocha

