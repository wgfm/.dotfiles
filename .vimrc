" init vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" vundle packages
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ervandew/supertab'
Bundle 'ervandew/eclim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'xoria256.vim'
Bundle 'ctrlp.vim'
Bundle 'ZoomWin'
Bundle 'Syntastic'
Bundle 'matchit.zip'
Bundle 'tComment'
Bundle 'tristen/vim-sparkup'
Bundle 'altercation/vim-colors-solarized'
Bundle 'plasticboy/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'toyamarinyon/vim-swift'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-fugitive'
Bundle 'fatih/vim-go'
Bundle 'mileszs/ack.vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-salve'
Bundle 'tpope/vim-leiningen'

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
