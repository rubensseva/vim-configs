" Config file for nvim with package manager dein
" Testing a change, just remove this line

" Dein packages
" IN ORDER TO INSTALL THIS, ENTER IN VIM: :call dein#install()
set nocompatible
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim
call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree') " File explorer

call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1
" and a lot more plugins.....
call dein#end()


"Done with dein packages


" Colorsheme
colorscheme desert

" Linenumbering
set number
set relativenumber

" Tabs and spaces and shit
set autoindent
set tabstop=4		" no. of spaces for tab in file
set shiftwidth=4	" no. of spaced for step in autoindent
set softtabstop=4	" no. of spaces for tab when editing
