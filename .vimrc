let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'wellle/targets.vim'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'chrisbra/unicode.vim'

Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'https://github.com/junegunn/limelight.vim'
Plug 'https://github.com/junegunn/goyo.vim'

Plug 'vimwiki/vimwiki'

call plug#end()


set background=dark

set number
set relativenumber
set wildmenu
set showcmd
set ruler

set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set cmdheight=2
set hlsearch

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>


set printfont=Courier:h8
command! -range=% HardcopyPdf <line1>,<line2> hardcopy > %.ps | !ps2pdf %.ps && rm %.ps

"==============================="
"           VIM WIKI            "
"==============================="
try
    source ~/vimwiki/vimwiki.vim
catch
    " no such file? no problem; just ignore it.
endtry

