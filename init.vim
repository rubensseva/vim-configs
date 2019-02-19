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

" Install Ale
Plug 'w0rp/ale'

" Intall NERDTree
Plug 'scrooloose/nerdtree'

" Install vim-javascript
Plug 'pangloss/vim-javascript'

" Get fzf plugin from fzf
" This assumes fzf is installed
Plug '~/.fzf'

call plug#end()

" -------------------------------------------------------------------------------------
" Vim-plug section end


" Colorsheme
colorscheme desert

" Linenumbering
set number
set relativenumber

" Tabs and spaces and shit
set autoindent
set tabstop=2		" no. of spaces for tab in file
set shiftwidth=2	" no. of spaced for step in autoindent
set softtabstop=2	" no. of spaces for tab when editing




