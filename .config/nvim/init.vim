call plug#begin()
Plug 'scrooloose/nerdTree'
Plug 'vim-airline/vim-airline'
call plug#end()
nmap <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR> :!sh -xc 'scp -r Notes www.thonis.eu:'<CR>
