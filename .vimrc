" init vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" vundle packages
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'xoria256.vim'
Plugin 'ctrlp.vim'
Plugin 'ZoomWin'
Plugin 'Syntastic'
Plugin 'matchit.zip'
Plugin 'tComment'
Plugin 'tristen/vim-sparkup'
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'honza/vim-snippets'

call vundle#end()

" vim options
filetype plugin indent on
syntax on
cabbr te tabedit
colorscheme xoria256
let g:airline_powerline_fonts = 1

" set background=dark
set expandtab
set nocompatible
set tabstop=2
set shiftwidth=2
set showtabline=2
set backspace=2
set relativenumber
set nohlsearch
set number
set wrap
set backspace=2
set cursorline
set t_Co=256
set colorcolumn=+1 " red line and over is error
set textwidth=80
set hlsearch

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let mapleader = ","

" enforce purity
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" Ctrl-P config
set wildignore+=*/target/*

" NERDTree config
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
