set scrolloff=8
set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
packloadall

call plug#begin(stdpath('data') . '/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'rafamadriz/friendly-snippets'

Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'habamax/vim-asciidoctor'

call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]

colorscheme nord

set completeopt=menu,menuone,noselect

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>, :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>. :e ~/.config/nvim/lua/lsp_config.lua<CR>
nnoremap <expr> <C-p> &buftype ==# 'quickfix' ? "\<C-P>" : ":GFiles\<CR>"
nnoremap <leader>pf :Files<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprev<CR>
nnoremap <leader>cl :.w !pbcopy<CR>
nmap <leader>op <Plug>(Prettier)

" Easier moving between splits
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Git
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gf :Git fetch<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gst :Git<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>grb :Git rebase<CR>
nnoremap <leader>gbl :Git blame<CR>

" Go
nnoremap <Leader>ee oif err != nil {<CR>}<CR><esc>kO

" Rust
let g:rustfmt_autosave = 1

" Search
let g:ackprg = 'ag --vimgrep'

lua require("lsp_config");

lua require("luasnip.loaders.from_vscode").load()

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

autocmd! FileType qf nnoremap <buffer> <leader>s <C-w><Enter><C-w>L
