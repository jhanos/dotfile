call plug#begin()
" Synthax highlight
Plug 'sheerun/vim-polyglot'

" auto pair
Plug 'jiangmiao/auto-pairs'

" Auto complete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

"Plug 'williamboman/mason.nvim'
"Plug 'williamboman/mason-lspconfig.nvim'
"Plug 'neovim/nvim-lspconfig'

"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'

Plug 'dense-analysis/ale', {'branch': 'v3.2.0'}
"Plug 'jhanos/ale', {'branch': 'feat-languagetool-suggestion'}
"
Plug 'Mofiqul/dracula.nvim'

call plug#end()

nnoremap <silent> <C-n> :GFiles<CR>
let g:coq_settings = { 'auto_start': 'shut-up' }
set expandtab
set tabstop=2
set shiftwidth=2
set mouse=

set showmatch
set ignorecase
set hlsearch
colorscheme dracula

let g:ale_markdown_markdownlint_options = "--disable MD013"

" Write this in your vimrc file
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0
