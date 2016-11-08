""""""""""""""""""""""""""""""""""""""""""""

                "ESSENTIALS"                

""""""""""""""""""""""""""""""""""""""""""""

"Enable Syntax Highlighting"
syntax enable

"Enables 256 Colors In Vim"
set t_Co=256

"Default Background"
set bg=light

"Setting Background"
function Dark()
    set bg=dark
endfunction
com Dark call Dark()

function Light()
    set bg=light
endfunction
com Light call Light()

"Configuring Text Colors"
hi Comment ctermfg=darkgray
hi Constant ctermfg=darkcyan
hi Identifier ctermfg=darkblue
hi Type ctermfg=brown
hi Statement ctermfg=brown
hi PreProc ctermfg=darkgreen

"Changes The Visual Mode Selection Highlight Color"
hi Visual ctermbg=black

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

"Automatic Word Wrapping"
set textwidth=80

"Loads Filetype-Specific Indent Files"
filetype indent on

"Visual Autocomplete For Command Menu"
set wildmenu

"Highlights Matching [{()}]"
set showmatch

"Highlight Search Results"
set hlsearch

"Changes The Search Highlight Color"
hi Search ctermbg=green

"Maps Ctrl-c To Unhighlight Searches"
map <C-c> :noh<CR>

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

"Maps Ctrl-N To Next Buffer"
nnoremap <C-N> :bnext<CR>

"Maps Ctrl-P To Previous Buffer"
nnoremap <C-P> :bprev<CR>

"Maps Space To Leader"
let mapleader="\<Space>"

"Maps Leader-T To FZF"
nnoremap <Leader>t :FZF<CR>

"Maps Leader-] To Tagbar"
nnoremap <Leader>] :Tagbar<CR>

"Word Processor Mode"
function WordProcessorMode()
    :Goyo
    setlocal spell
    hi clear SpellBad
    hi SpellBad cterm=underline
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    setlocal textwidth=0
    setlocal wrapmargin=0
endfunction
com Word call WordProcessorMode()

"Plugin Section"

"Installation"
"Check Vim-Plug Installation Guide"

"Use PlugInstall To Install Plugins"
"Use PlugUpdate To Update Plugins"

call plug#begin()

"FZF Plugin"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"NERDTree Will Be Loaded On The First Invocation Of NERDTreeToggle Command"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"Supertab Plugin"
Plug 'https://github.com/ervandew/supertab.git'

"DelimitMate Plugin"
Plug 'https://github.com/Raimondi/delimitMate.git'

"Indent Guides Plugin"
Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'

"Gitgutter Plugin"
Plug 'https://github.com/airblade/vim-gitgutter.git'

"Tagbar Plugin"
Plug 'https://github.com/majutsushi/tagbar.git'

"Vim-Airline Plugin"
Plug 'https://github.com/vim-airline/vim-airline.git'

"Vim-Airline-Themes Plugin"
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

"Goyo Plugin"
Plug 'https://github.com/junegunn/goyo.vim.git'

"Limelight Plugin"
Plug 'https://github.com/junegunn/limelight.vim.git'

call plug#end()

"Opens NERDTree On Startup"
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

"Closes Vim If NERDTree Is The Only Window Left Open"
autocmd bufenter * if(winnr("$")==1&&exists("b:NERDTree")&&b:NERDTree.isTabTree())|q|endif

"Enables Indent Guides"
let g:indent_guides_enable_on_vim_startup=1

"Configuring Indent Guides"
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermfg=black ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermfg=black ctermbg=black

"Configuring Vim-Airline"
let g:airline_left_sep=""
let g:airline_right_sep=""
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'

"Configuring Vim-Airline-Themes"
let g:airline_theme='murmur'

"Configuring Limelight With Goyo"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"Configuring Limelight"
"Color name (:help cterm-colors) or ANSI code"
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"Beginning/end of paragraph"
"When there's no empty line between the paragraphs"
"and each paragraph starts with indentation"
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

"Highlighting priority (default: 10)"
"Set it to -1 not to overrule hlsearch"
let g:limelight_priority = -1
