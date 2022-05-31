""""""""""
" PLUGINS "
"""""""""""
"colorscheme pet cemetary
" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
" Plug 'gilgigilgil/anderson.vim'
" Plug 'joshdick/onedark.vim'
" Plug 'AlessandroYorba/Despacio'
" Plug 'w0ng/vim-hybrid'
" Plug 'nightsense/carbonized'
" Plug 'oblitum/rainbow'
" Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
" Plug 'morhetz/gruvbox'
" Plug 'jacoborus/tender.vim'
call plug#begin('~/.vim/plugged')
"colorschemes
Plug 'phanviet/vim-monokai-pro'
"display
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
"language specific
Plug 'sheerun/vim-polyglot'
Plug 'avakhov/vim-yaml'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'digitaltoad/vim-pug'
Plug 'tomlion/vim-solidity'
Plug 'lepture/vim-jinja'
Plug 'HerringtonDarkholme/yats.vim'
"basic functionality++
Plug 'haya14busa/incsearch.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"bonus features
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fmoralesc/Vim-pad'  " throwing insert mode mapping error on start
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'
Plug 'pelodelfuego/vim-swoop'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'chrisbra/Colorizer'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"misc
Plug 'stevearc/vim-arduino'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Jedi stuff
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()


"""""""""""
" DISPLAY "
"""""""""""
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme monokai_pro
let g:lightline = { 'colorscheme': 'monokai_pro' }
" make comments bright
hi Comment guifg=#FFA500
" remove -- insert -- now redundent thanks to lightline
set noshowmode

set laststatus=2
"whitespace highlighting
:hi ExtraWhitespace guibg=#990000 ctermbg=red
if has('nvim') || has('termguicolors')
  set termguicolors
endif
" tmux needs this to be happy

"""""""""""""""""
" AUTO COMMANDS "
"""""""""""""""""
let g:followCursor = 0

function! ToggleFollowCursor()
    " Switch the toggle variable
    let g:followCursor = !get(g:, 'followCursor', 1)

    " Enable if toggled on
    if g:followCursor
        augroup FollowCursor
        au!
        au VimEnter,WinEnter,BufWinEnter * setlocal cursorline | setlocal cursorcolumn
        au WinLeave * setlocal nocursorline | setlocal nocursorcolumn
        augroup END
        setlocal cursorline | setlocal cursorcolumn
    " reset and disable options
    else
        augroup FollowCursor
            autocmd!
        augroup END
        setlocal nocursorline | setlocal nocursorcolumn
    endif
endfunction

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
set scrolloff=2
"linenumbers on by default
set nu
"time to wait for next key in sequence
set timeoutlen=400

let g:python3_host_prog = '/usr/bin/python3'



"""""""""""""""""""""""""""""""
" SPACING / FILETYPE SETTINGS "
"""""""""""""""""""""""""""""""
filetype plugin indent on
filetype plugin on
set shiftround
set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab softtabstop=2
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype jinja setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype sass setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab
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
map <F3> :set nu<CR>
map <F4> :set nonu<CR>
"remap K to inverse of J
" noremap K a<CR><ESC>

" autocmd
nnoremap <leader>f :call ToggleFollowCursor()<CR>


""""""""""""""""""
" PLUGIN KEYMAPS "
""""""""""""""""""
"open nerd tree
map <leader>t :NERDTreeToggle<CR>
let NERDTreeMapOpenSplit="s"
let NERDTreeMapOpenVSplit="v"
"open ctrlp
map <leader>o :CtrlPMixed<CR>
"open undotree
nnoremap <F5> :UndotreeToggle<cr>
nmap <leader>ss<leader> *g:pad#maps#incsearch*
"fzf
nmap <leader>a :Ag<space>
" vim-jedi
let g:jedi#goto_command = "<leader>jc"
let g:jedi#goto_assignments_command = "<leader>jg"
let g:jedi#goto_stubs_command = "<leader>js"
let g:jedi#goto_definitions_command = "<leader>jd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>jn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>jr"
" ale
nmap <silent> <leader>E <Plug>(ale_previous_wrap)
nmap <silent> <leader>e <Plug>(ale_next_wrap)
nnoremap <leader><C-e> :ALEPopulateLocList<cr>

" I think this is old
" function! ToggleAleList()
"     let g:ale_open_list = !g:ale_open_list
" endfunction


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
""use dir you started vim in
let g:ctrlp_working_path_mode = 0
""use ag
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"[vim-pad]
let g:pad#dir = '~/dotfiles/notes'
" height of the buffer that opens
let g:pad#window_height = 25

"[gitsigns]
highlight link GitSignsChangeNr Special
highlight link GitSignsAddNr Pmenu
highlight link GitSignsDeleteNr NonText
lua << EOF
require('gitsigns').setup{
    numhl = true,
    signcolumn = false,
}
EOF
autocmd ColorScheme * highlight! link SignColumn Background

"[ale]
set signcolumn=number
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
highlight ALEErrorSign guifg=#FF0000 guibg=dark
highlight! ALEWarningSign guifg=#FFFF00 guibg=dark
let g:ale_linters = {
\    'python': ['flake8', 'pylint'],
\    'javascript': ['prettier', 'eslint'],
\    'json': ['jsonlint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'black'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['fixjson'],
\}

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }
let g:lightline.active = {
            \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
            \            [ 'lineinfo' ],
	    \            [ 'percent' ],
	    \            [ 'fileformat', 'fileencoding', 'filetype'] ] }

"[ultisnips]
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsSnippetDirectories = ['ultisnips', $HOME.'/dotfiles/ultisnips']
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

"[vim-jedi]
" disable the pydocs window
set completeopt-=preview
