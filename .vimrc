syntax enable

filetype indent plugin on
filetype plugin on
execute pathogen#infect()
set background=dark
set clipboard=unnamedplus
colorscheme solarized
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4
autocmd Filetype html.handlebars setlocal tabstop=2 shiftwidth=2 expandtab
let @d= 'I<div>^M^I^[A^M</div>^['
lef @i= 'A^Mimport ipdb^Mipdb.set_trace()^['
autocmd BufWritePost *.py call Flake8()
