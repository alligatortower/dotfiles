"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-bufferline'
Plug 'garbas/vim-snipmate'
Plug 'haya14busa/incsearch.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'ctrlp.vim'
Plug 'pytest.vim'
Plug 'commentary.vim'
Plug 'bling/vim-airline'
Plug 'fmoralesc/vim-pad'
Plug 'rking/ag.vim'
call plug#end()
syntax enable


""""""""""""""""""
" DISPLAY STUFFS "
""""""""""""""""""
set background=dark
se t_Co=16
colorscheme solarized
"whitespace highlighting
:hi ExtraWhitespace guibg=#990000 ctermbg=red


"""""""""""""""""
" MISC SETTINGS "
"""""""""""""""""
set clipboard=unnamedplus
set smartcase
set incsearch
set title
set numberwidth=1
set hidden
set hlsearch
set laststatus=2


"""""""""""""""""""""""""""""""
" SPACING / FILETYPE SETTINGS "
"""""""""""""""""""""""""""""""
filetype indent plugin on
filetype plugin on
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab


"""""""""""
" KEYMAPS "
"""""""""""
let mapleader=";"
"fastsave
map <Esc><Esc> :w<CR>
"give me an extra year of my life
:inoremap jk <ESC>
"Y yanks to end of line (consistency with D)
map Y y$
"incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
"remove highlighting
map <leader>h :noh<CR>
"map buffer tabbing
map <leader>k :bn<CR>
map <leader>j :bp<CR>
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
map <F2> :set background=dark<CR> :hi ExtraWhitespace guibg=#990000 ctermbg=red<CR>
map <F3> :set background=light<CR> :hi ExtraWhitespace guibg=#990000 ctermbg=red<CR>
"line numbers
map <F4> :set nu<CR> :set rnu<CR>
map <F5> :set nornu<CR> :set nonu<CR>
"open nerd tree
map <leader>t :NERDTreeToggle<CR>
"open ctrlp
map <leader>o :CtrlPMixed<CR>
"paste toggle
set pastetoggle=<F6>


"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
"nerd tree start on empty vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"nerd tree close if it's the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"nerd tree ignore filetypes
let NERDTreeIgnore = ['\.pyc$']
"airline configs
let g:airline_exclude_preview = 0
"vim-pad directory
let g:pad#dir = '~/notes'
autocmd BufWritePost *.py call Flake8()
