""""""""""""""""""""""""""""""""""""""""""""

                "ESSENTIALS"                

""""""""""""""""""""""""""""""""""""""""""""

"Enable syntax highlighting"
syntax enable

"Default background"
set bg=dark

"Setting background"
function Dark()
    set bg=dark
endfunction
com Dark call Dark()

function Light()
    set bg=light
endfunction
com Light call Light()

"Number of visual spaces per tab"
set tabstop=4

"Number of spaces in tab when editing"
set softtabstop=4

"Tabs are spaces"
set expandtab

"Display line numbers"
set number

"Highlights current line"
set cursorline

"Automatic Word Wrapping"
set textwidth=80

"Loads filetype-specific indent files"
filetype indent on

"Visual autocomplete for command menu"
set wildmenu

"Highlights matching [{()}]"
set showmatch

"Highlight search results"
set hlsearch

"Incremental searches"
set incsearch

"Start diff mode with vertical splits"
set diffopt=vertical

"Always displays the status line, even if only one window is displayed"
set ls=2

"Display the cursor position on the last line of the screen or in the status line of a window"
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

"Changing the status line colour to show insert or normal mode"
if version >= 700
    highlight statusLine cterm=bold ctermfg=black ctermbg=blue
    au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=blue
    au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=green
endif
