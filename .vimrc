"""""""""""
" PLUGINS "
"""""""""""
call plug#begin('~/.vim/plugged')
"display
Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'oblitum/rainbow'
"language specific
Plug 'mustache/vim-mustache-handlebars'
Plug 'avakhov/vim-yaml'
Plug 'pytest.vim'
"basic functionality++
Plug 'tpope/vim-surround'
Plug 'bling/vim-bufferline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'haya14busa/incsearch.vim'
Plug 'commentary.vim'
Plug 'rking/ag.vim'
Plug 'rhysd/clever-f.vim'
Plug 'bling/vim-aIRline'
"bonus features
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'ctrlp.vim'
Plug 'fmoralesc/Vim-pad'
Plug 'garbas/vim-snipmate'
Plug 'pelodelfuego/vim-swoop'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
"misc
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end()
syntax enable


""""""""""""""""""
" DISPLAY STUFFS "
""""""""""""""""""
if has('gui_running')
    colorscheme onedark
    set lines=100 columns=200
    " onedark doesn't set selected tab color correctly for whatever reason
    hi TabLineSel  guifg=#999 guibg=#222
else
    set background=dark
    set t_Co=256
    let base16colorspace=256
    colorscheme base16-mocha
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
" If the Vim buffer for a file doesn't have any changes and Vim detects the
" file has been altered, quietly update it
set autoread
set updatetime=250


"""""""""""""""""""""""""""""""
" SPACING / FILETYPE SETTINGS "
"""""""""""""""""""""""""""""""
filetype indent plugin on
filetype plugin on
set shiftround
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab setl indentkeys-=<:>


"""""""""""
" KEYMAPS "
"""""""""""
let mapleader="\\"
" want space to be mapleader but it doesn't show up in showcmd, so \ is
" basically an alias
map <space> \
"fastsave
map <Esc><Esc> :w<CR>
"give me a cumulative extra year of my life
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
"spellcheck toggle
map <F5> :setlocal spell! spelllang=en_us<CR>
"remap K to inverse of J
noremap K a<CR><ESC>
"open nerd tree
map <leader>t :NERDTreeToggle<CR>
"open ctrlp
map <leader>o :CtrlPMixed<CR>
"paste toggle
set pastetoggle=<F6>


"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""
"[nerd tree]
""start on empty vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""close if it's the only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""ignore filetypes
let NERDTreeIgnore = ['\.pyc$']
"[ctrlp]
""not slow as shit
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"[airline]
""configs
let g:airline_exclude_preview = 0
"[vim-pad]
""directory
let g:pad#dir = '~/settings/notes'
"[syntastic]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"[rainbow parenthesis]
let g:rainbow_active = 1
"[ultisnips]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsSnippetsDir='~/.vim/ultisnips'


"""""""""""""
" GVIM ONLY "
"""""""""""""
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
