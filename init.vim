" My personal vim configuration
" This is very a much a work in progress so expect to find a lot of errors and
" bad practice in this file.

" TODO: remove code concerning non working gvim compatability




"       *********************************************
"       *                                           *
"       *                                           *
"       *                PLUGINS                    *  
"       *                                           *
"       *                                           *
"       *********************************************


" Vim-plug section start
" -------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

    " Install deoplete
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    let g:deoplete#enable_at_startup = 1

    " install tabnine
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

    " Install Ale
    Plug 'w0rp/ale'

    " Intall NERDTree
    Plug 'scrooloose/nerdtree'

    " JavaScript, react, jsx specific plugins
    " Install vim-javascript
    Plug 'pangloss/vim-javascript'
    " Install vim-jsx to fix some weird jsx syntax errors
    Plug 'mxw/vim-jsx'

    " Install fzf
    " This assumes fzf is installed
    Plug '~/.fzf'

    " Install lightline
    Plug 'itchyny/lightline.vim'

    " Install gitgutter
    Plug 'airblade/vim-gitgutter'

    " Install vim fugitive
    " Comprehensive git plugin
    Plug 'tpope/vim-fugitive'

    " Install ternjs completion, and node tern package
    " This plugin needs node and npm tern to be installed globally
    Plug 'carlitux/deoplete-ternjs'

    " Get a fresh start screen
    Plug 'mhinz/vim-startify'

    " Get solarized scheme
    Plug 'altercation/vim-colors-solarized'

    " Get gruvbox theme
    Plug 'morhetz/gruvbox'

    " Install file icon
    Plug 'ryanoasis/vim-devicons'


call plug#end()

" -------------------------------------------------------------------------------------
" Vim-plug section end

" syn match NERDTreeTxtFile #^\s\+.*txt$#
" highlight NERDTreeTxtFile ctermbg=blue ctermfg=magenta

syn match NERDTreeTxtFile #^\s\+.*txt$#
hi def link NERDTreeTxtFile error


" Make lightline show full path let g:lightline = { \ 'active': { \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' , 'fugitive']], 
          \ },
          \ 'component_function': {
          \   'fugitive': 'fugitive#statusline'
          \ }
          \ }

" Ale configuration
    " Set fixers
    let g:ale_fixers = {'javascript': ['eslint']}


" For java completion
    filetype plugin indent on
    set omnifunc=syntaxcomplete#Complete

" Ternjs configs
    " Set bin if you have many instalations
    let g:deoplete#sources#ternjs#tern_bin = '/path/to/tern_bin'
    let g:deoplete#sources#ternjs#timeout = 1

    " Whether to include the types of the completions in the result data. Default: 0
    let g:deoplete#sources#ternjs#types = 1

    " Whether to include the distance (in scopes for variables, in prototypes for 
    " properties) between the completions and the origin position in the result 
    " data. Default: 0
    let g:deoplete#sources#ternjs#depths = 1

    " Whether to include documentation strings (if found) in the result data.
    " Default: 0
    let g:deoplete#sources#ternjs#docs = 1

    " When on, only completions that match the current word at the given point will
    " be returned. Turn this off to get all results, so that you can filter on the 
    " client side. Default: 1
    let g:deoplete#sources#ternjs#filter = 0

    " Whether to use a case-insensitive compare between the current word and 
    " potential completions. Default 0
    let g:deoplete#sources#ternjs#case_insensitive = 1

    " When completing a property and no completions are found, Tern will use some 
    " heuristics to try and return some properties anyway. Set this to 0 to 
    " turn that off. Default: 1
    let g:deoplete#sources#ternjs#guess = 0

    " Determines whether the result set will be sorted. Default: 1
    let g:deoplete#sources#ternjs#sort = 0

    " When disabled, only the text before the given position is considered part of 
    " the word. When enabled (the default), the whole variable name that the cursor
    " is on will be included. Default: 1
    let g:deoplete#sources#ternjs#expand_word_forward = 0

    " Whether to ignore the properties of Object.prototype unless they have been 
    " spelled out by at least two characters. Default: 1
    let g:deoplete#sources#ternjs#omit_object_prototype = 0

    " Whether to include JavaScript keywords when completing something that is not 
    " a property. Default: 0
    let g:deoplete#sources#ternjs#include_keywords = 1

    " If completions should be returned when inside a literal. Default: 1
    let g:deoplete#sources#ternjs#in_literal = 0


    "Add extra filetypes
    let g:deoplete#sources#ternjs#filetypes = [
                    \ 'jsx',
                    \ 'javascript.jsx',
                    \ 'vue',
                    \ '...'
                    \ ]


"       *********************************************
"       *                                           *
"       *                                           *
"       *          BASIC CONFIGURATIONS             *  
"       *                                           *
"       *                                           *
"       *********************************************


" set vim cursor block or line depending on mode
    :autocmd InsertEnter * set cul
    :autocmd InsertLeave * set nocul

" Linenumbering
    set number
    set relativenumber

" Tabs and spaces
    set autoindent
    set tabstop=2		" no. of spaces for tab in file
    set shiftwidth=2	" no. of spaced for step in autoindent
    set softtabstop=2	" no. of spaces for tab when editing
    set expandtab " set spaces instead of tabs

" For buffers
    " set hidden

" Make vim remember cursor position
    " Usually we would configure .viminfo, but startify plugins handles this
    "So these lines are commented out
    " Tell vim to remember certain things when we exit
    "  '10  :  marks will be remembered for up to 10 previously edited files
    "  "100 :  will save up to 100 lines for each register
    "  :20  :  up to 20 lines of command-line history will be remembered
    "  %    :  saves and restores the buffer list
    "  n... :  where to save the viminfo files
    " set viminfo='10,\"100,:20,%,n~/.viminfo
    " Function for rememebering cursor
    function! ResCur()
      if line("'\"") <= line("$")
        normal! g`"
        return 1
      endif
    endfunction
    augroup resCur
      autocmd!
      autocmd BufWinEnter * call ResCur()
    augroup END


" Custom mappings
    " Set leader key
    nnoremap <space> = <NOP>
    let mapleader = " "
    " Nerdtree
    map <C-o> :NERDTreeToggle<CR>
    " Deoplete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    " Vimrc stuff
    :nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    :nnoremap <leader>sv :source $MYVIMRC<cr>
    " FZF command
    nnoremap <leader>fe :FZF<cr>

" Colorsheme
    " Create a dictionary of the colors for later use
    " Last colors for gui are wrong
    let g:sol = {
      \"gui": {
        \"base03": "#002b36",
        \"base02": "#073642",
        \"base01": "#586e75",
        \"base00": "#657b83",
        \"base0": "#839496",
        \"base1": "#93a1a1",
        \"base2": "#eee8d5",
        \"base3": "#fdf6e3",
        \"yellow": "#b58900",
        \"orange": "#cb4b16",
        \"red": "#dc322f",
        \"magenta": "#d33682",
        \"violet": "#6c71c4",
        \"blue": "#268bd2",
        \"cyan": "#2aa198",
        \"green": "#719e07",
        \"purple": "#dc323f",
        \"turquoise": "#dc324f",
        \"seagreen": "#dc326f"
      \},
      \"cterm": {
        \"base03": 8,
        \"base02": 0,
        \"base01": 10,
        \"base00": 11,
        \"base0": 12,
        \"base1": 14,
        \"base2": 7,
        \"base3": 15,
        \"yellow": 3,
        \"orange": 9,
        \"red": 1,
        \"magenta": 5,
        \"violet": 13,
        \"blue": 4,
        \"cyan": 6,
        \"green": 2,
        \"purple": 56,
        \"turquoise": 44,
        \"seagreen": 84
      \}
    \}

    " favorites:
    " happy_hacking
    " desert
    " minimalist
    " gruvbox (but should be dark mode?)
    " molokayo
    " pablo
    " gruvbox
    set background=dark
    colorscheme gruvbox
    
    " Configure colors for devicons
    " This dependends on the color dictionary created earlier
    function! DeviconsColors(config)
          let colors = keys(a:config)
          augroup devicons_colors
            autocmd!
            for color in colors
              if color == 'normal'
                exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                  \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                  \ 'else | '.
                  \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                  \ 'endif'
              elseif color == 'emphasize'
                exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
                  \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
                  \ 'else | '.
                  \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
                  \ 'endif'
              else
                exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
              endif
              exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
            endfor
          augroup END
        endfunction
        let g:devicons_colors = {
          \'normal': ['', '', '', '', ''],
          \'emphasize': ['', '', '', '', '', '', ''],
          \'yellow': ['', '', '', ''],
          \'orange': ['', '', '', 'λ', '', ''],
          \'red': ['', '', '', '', '', '', '', '', ''],
          \'magenta': [''],
          \'violet': ['', '', '', ''],
          \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
          \'cyan': ['', '', '', ''],
          \'green': ['', '', '', '', '', ''],
          \'purple': [''],
          \'turquoise': [''],
          \'seagreen': ['']
        \}
        call DeviconsColors(g:devicons_colors)


