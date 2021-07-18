call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'dylanaraps/wal.vim'

Plug 'chrisbra/unicode.vim'

Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'https://github.com/junegunn/limelight.vim'
Plug 'https://github.com/junegunn/goyo.vim'

call plug#end()


colorscheme wal
set background=dark

set number
set wildmenu
set showcmd
set ruler

set autoindent
set shiftwidth=4
set tabstop=4
set cmdheight=2
set hlsearch

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif


set printfont=Courier:h8
command! -range=% HardcopyPdf <line1>,<line2> hardcopy > %.ps | !ps2pdf %.ps && rm %.ps
