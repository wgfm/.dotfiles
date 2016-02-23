" init vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" vundle packages
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xoria256.vim'
Plugin 'ctrlp.vim'
Plugin 'ZoomWin'
Plugin 'Syntastic'
Plugin 'matchit.zip'
Plugin 'tComment'
Plugin 'tristen/vim-sparkup'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'toyamarinyon/vim-swift'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-leiningen'

call vundle#end()

" vim options
filetype plugin indent on
syntax on
cabbr te tabedit
colorscheme xoria256
" colorscheme solarized
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

" Java stuff
map <leader>ma :JavaImportOrganize <CR>
map <leader>fw :%s/\s\+$//<CR>:let @/=''<CR>
map <leader>mp :JavaGetSet <CR>
map <leader>mg :JavaGet <CR>
map <leader>ms :JavaSet <CR>
map <leader>mc :JavaCorrect <CR>
map <leader>mr :JavaRename
map <leader>fi gg=G
map <leader>mi :JavaImpl <CR>
map <leader>md :JavaDelegate <CR>
map <leader>mx :JavaConstructor <CR>
map <leader>mm :JavaSearch <CR>
map <leader>cd :Eval<CR>
map <leader>ca :%Eval<CR>
map <leader>mk gg:r!pwd<CR>/java<CR>wwd0:s/\//\./g<CR>ipackage <ESC>A;<ESC>kddp
map <leader>ck gg:r!pwd<CR>/\/src\/<CR>5ld0:s/\//\./g<CR>:s/_/-/g<CR>0i(ns <ESC>A)<ESC>kddpk$i.
map <leader>ccO O;; ~~~~~~<ESC>2hi
map <leader>cco o;; ~~~~~~<ESC>2hi

" Markdown stuff
map <leader>d- yypVr-
map <leader>d= yypVr=
