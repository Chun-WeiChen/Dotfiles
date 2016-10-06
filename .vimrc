""""""""""""""""""""""""""""""""""""""""""""

                "ESSENTIALS"                

""""""""""""""""""""""""""""""""""""""""""""

"Enable Syntax Highlighting"
syntax enable

"Default Background"
set bg=dark

"Setting Background"
function Dark()
    set bg=dark
endfunction
com Dark call Dark()

function Light()
    set bg=light
endfunction
com Light call Light()

"Number Of Visual Spaces Per Tab"
set tabstop=4

"Number Of Spaces In Tab When Editing"
set softtabstop=4

"Tabs Are Spaces"
set expandtab

"Display Line Numbers"
set number

"Highlights Current Line"
set cursorline

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

"Changes The Search Highlighting Colour"
hi Search ctermbg=green

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

"Word Processor Mode"
function WordProcessorMode()
    setlocal spell
    setlocal wrap
    setlocal linebreak
    setlocal nolist
    setlocal textwidth=0
    setlocal wrapmargin=0
endfunction
com Word call WordProcessorMode()

"Changing The Status Line Colour To Show Insert Or Normal Mode"
highlight statusLine cterm=bold ctermfg=black ctermbg=blue
au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=blue
au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=green

"Plugin Section"

"Installation"
"Check Vim-Plug Installation Guide"

"Use PlugInstall To Install Plugins"
"Use PlugUpdate To Update Plugins"

call plug#begin()

"NERDTree Will Be Loaded On The First Invocation Of NERDTreeToggle Command"
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

"Opens NERDTree On Startup"
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

"Closes Vim If NERDTree Is The Only Window Left Open"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
