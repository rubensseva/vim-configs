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

" Install vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

" Install gitgutter
Plug 'airblade/vim-gitgutter'

" Install vim fugitive
" Comprehensiv git plugin
Plug 'tpope/vim-fugitive'

" Install some more colorschemes :) 
Plug 'rafi/awesome-vim-colorschemes'

call plug#end()

" -------------------------------------------------------------------------------------
" Vim-plug section end

" Tab complete for deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Nerdtree toggle to <ctrl-O>
map <C-o> :NERDTreeToggle<CR>

" Make lightline show full path
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ }
      \ }

" Ale configuration
" Set fixers
" Set fixers
let g:ale_fixers = {'javascript': ['eslint']}


" Colorsheme
" favorites:
" happy_hacking
" desert
" minimalist
" gruvbox (but should be dark mode?)
" molokayo
" pablo
colorscheme gruvbox
set background=dark
set termguicolors

" set vim cursor block or line depending on mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Linenumbering
set number
set relativenumber

" Tabs and spaces and shit
set autoindent
set tabstop=2		" no. of spaces for tab in file
set shiftwidth=2	" no. of spaced for step in autoindent
set softtabstop=2	" no. of spaces for tab when editing
set expandtab " set spaces instead of tabs





