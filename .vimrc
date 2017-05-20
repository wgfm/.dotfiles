" init vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" vundle packages
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'ctrlp.vim'
Plugin 'Syntastic'
Plugin 'matchit.zip'
Plugin 'tComment'
Plugin 'tristen/vim-sparkup'
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Themes
Plugin 'xoria256.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'albertorestifo/github.vim'

call vundle#end()

" vim options
filetype plugin indent on
syntax on
cabbr te tabedit
set background=light
colorscheme PaperColor

" set background=dark
set laststatus=2
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
set textwidth=90
set hlsearch

" turn off vim-markdown folding
let g:vim_markdown_folding_disabled=1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let mapleader = ","
"let g:go_fmt_command = "goimports"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'papercolor'
let python_highlight_builtins = 1

" enforce purity
noremap  <Up> <Nop>
noremap  <Down> <Nop>
noremap  <Left> <Nop>
noremap  <Right> <Nop>

" Ctrl-P config
set wildignore+=*/target/*

" Leader shortcuts
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" NERDTree config
map <C-\> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * if !argc() | NERDTreeMirror | endif

" Easier buffer switching
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Clipboard utils
:nnoremap <F6> :w !pbcopy<CR><CR>
:nnoremap <C-F6> :'a,'bw !pbcopy<CR><CR>

let g:ycm_goto_buffer_command = 'vertical-split'
