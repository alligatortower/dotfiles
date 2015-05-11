call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'mustache/vim-mustache-handlebars'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-surround'
call plug#end()
syntax enable

"colorscheme
"set color based on time of day
let hour = strftime("%H")
if 6 <= hour && hour < 18
    set background=dark
else
    set background=light
endif

se t_Co=16
colorscheme solarized

"general 
set clipboard=unnamedplus
set ignorecase
set smartcase
set incsearch
set title
set numberwidth=1

" spacing / styling
filetype indent plugin on
filetype plugin on
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab

" keymaps
let mapleader=";"
"fastsave
map <Esc><Esc> :w<CR>
"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"remove highlighting
map <leader>h :noh<CR>
"give me an extra year of my life
:inoremap jk <ESC>
"map buffer tabbing
map <leader>b :bn<CR> 
map <leader>B :bp<CR>
"window resizing
map <F8> <C-w>>
map <S-F8> <C-w><
map <F9> <C-w>+
map <S-F9> <C-w>-
"window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
"change background color
map <F2> :set background=light<CR>
map <F3> :set background=dark<CR>
"line numbers
map <F4> :set nu<CR> :set rnu<CR>
map <F5> :set nornu<CR> :set nonu<CR>

autocmd BufWritePost *.py call Flake8()

" bufferline echo to statusline
let g:bufferline_echo = 0
autocmd VimEnter *
\ let &statusline='%{bufferline#refresh_status()}'
  \ .bufferline#get_status_string()

set laststatus=2

