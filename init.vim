"""""""""""
" PLUGINS "
"""""""""""
"colorscheme pet cemetary
" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
" Plug 'gilgigilgil/anderson.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
" Plug 'AlessandroYorba/Despacio'
" Plug 'w0ng/vim-hybrid'
call plug#begin('~/.vim/plugged')
"colorschemes
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
"display
Plug 'oblitum/rainbow'
"language specific
Plug 'avakhov/vim-yaml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pytest.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'tomlion/vim-solidity'
Plug 'lepture/vim-jinja'
Plug 'HerringtonDarkholme/yats.vim'
"basic functionality++
Plug 'itchyny/lightline.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/clever-f.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"bonus features
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'fmoralesc/Vim-pad'  " throwing insert mode mapping error on start
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'pelodelfuego/vim-swoop'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Floobits/floobits-neovim'
Plug 'KabbAmine/zeavim.vim', {'on': [
			\	'Zeavim', 'Docset',
			\	'<Plug>Zeavim',
			\	'<Plug>ZVVisSelection',
			\	'<Plug>ZVKeyDocset',
			\	'<Plug>ZVMotion'
			\ ]}
Plug 'euclio/vim-markdown-composer'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"misc
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end()


"""""""""""
" DISPLAY "
"""""""""""
colorscheme challenger_deep
let g:lightline = { 'colorscheme': 'challenger_deep'}
set laststatus=2
"whitespace highlighting
:hi ExtraWhitespace guibg=#990000 ctermbg=red
if has('nvim') || has('termguicolors')
  set termguicolors
endif

"""""""""""""""""
" MISC SETTINGS "
"""""""""""""""""
"use system clipboard
set clipboard=unnamedplus
"only search case senstivie if uppercase letter used
set ignorecase smartcase
"window title = file (path)
set title
"minimal line number gutter
set numberwidth=1
"hide buffers when :e-ing out
set hidden
"quicker updates
set updatetime=250
"start scroll when one line from top or bottom
set scrolloff=1
"linenumbers on by default
set nu
set rnu
"must be set before yanking keys are remapped
call yankstack#setup()


"""""""""""""""""""""""""""""""
" SPACING / FILETYPE SETTINGS "
"""""""""""""""""""""""""""""""
filetype plugin indent on
filetype plugin on
set shiftround
set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype jinja setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 expandtab
let g:jsx_ext_required = 0


"""""""""""
" KEYMAPS "
"""""""""""
let mapleader=" "
"fastsave
map <Esc><Esc> :w<CR>
"give me a cumulative extra year of my life
:inoremap jk <ESC>
"Y yanks to end of line (consistency with D)
map Y y$
"remove highlighting
map <leader>h :noh<CR>
"map buffer kill
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


""""""""""""""""""
" PLUGIN KEYMAPS "
""""""""""""""""""
"open nerd tree
map <leader>t :NERDTreeToggle<CR>
"open ctrlp
map <leader>o :CtrlPMixed<CR>
"open undotree
nnoremap <F5> :UndotreeToggle<cr>
"yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


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
""save cache
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
""use ag
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


"[vim-pad]
let g:pad#dir = '~/dotfiles/notes'

"[syntastic]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ["flake8"]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"[rainbow parenthesis]
let g:rainbow_active = 1

"[ultisnips]
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsSnippetsDir = $HOME."/.config/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.config/UltiSnips']
let g:UltiSnipsEnableSnipMate = 0

"[undotree]
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

"[fzf]
let g:fzf_layout = { 'down': '~40%' }

"[deoplete]
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
