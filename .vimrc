call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
call plug#end()
syntax enable

set background=dark
colorscheme solarized
set clipboard=unnamedplus
set ignorecase
set smartcase
set incsearch

" spacing / styling
filetype indent plugin on
filetype plugin on
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab

" keymaps
map <Esc><Esc> :w<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
:inoremap jk <ESC>

autocmd BufWritePost *.py call Flake8()

