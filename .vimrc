"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'
Plug 'joshdick/onedark.vim'
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
Plug 'bling/vim-aIRline'
Plug 'fmoralesc/Vim-pad'
Plug 'rking/ag.vim'
Plug 'pelodelfuego/vim-swoop'
Plug 'davidhalter/jedi-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sloria/vim-ped'
Plug 'rhysd/clever-f.vim'
Plug 'oblitum/rainbow'
Plug 'craigemery/vim-autotag'
Plug 'vim-scripts/taglist.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'deris/vim-duzzle'
Plug 'avakhov/vim-yaml'
call plug#end()
syntax enable

""""""""""""""""""
" DISPLAY STUFFS "
""""""""""""""""""
if has('gui_running')
    colorscheme onedark
    set lines=100 columns=200
else
    set background=dark
    se t_Co=16
    colorscheme solarized
endif

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
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab


"""""""""""
" KEYMAPS "
"""""""""""
let mapleader="\\"
" want space to be mapleader but it doesn't show up in showcmd, so \ is
" basically an alias
map <space> \
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
nnoremap Q :bd<CR>
"window navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
"window resizing
map <F8> <C-w>>
map <S-F8> <C-w><
map <F9> <C-w>+
map <S-F9> <C-w>-
"line numbers
map <F3> :set nu<CR>:set rnu<CR>
map <F4> :set nornu<CR>:set nonu<CR>
"remap K to inverse of J
noremap K a<CR><ESC>
"open nerd tree
map <leader>t :NERDTreeToggle<CR>
"open ctrlp
map <leader>o :CtrlPMixed<CR>
"paste toggle
set pastetoggle=<F6>
"vim ped
nmap <leader>e <Plug>PedPrompt
nmap <leader>E <Plug>PedCwordExec
vmap <leader>e <Plug>PedVwordExec


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
let g:pad#dir = '~/settings/notes'
" flake8 magic
autocmd BufWritePost *.py call Flake8()
" Taglist
map <f11> :TlistOpen<cr>
" Rainbow Parenthesis
let g:rainbow_active = 1

if has('gui_running')
    """""""""""""""""""""""""""""""""""""""""""""""
    " Keymaps only gvim needs for whatever reason "
    """""""""""""""""""""""""""""""""""""""""""""""
    nmap <leader><esc> :Pad ls<CR>
    nmap <leader>n :Pad new<CR>


    """""""""""""""""
    " GVIM SETTINGS "
    """""""""""""""""
    " Remove toolbar and scrollbars from gVim,
    " because, frankly, they are a waste of space.
    set guioptions-=T
    set guioptions-=m

    " Remove scrollbars
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b

    " Use non-gui tabline
    set guioptions-=e

    " Automagically yank to windowing system clipboard on visual select.
    " This makes gvim behave like a normal unix application.
    set guioptions+=a

    " Use console dialogs instead of popup dialogs, gosh
    set guioptions+=c
endif
