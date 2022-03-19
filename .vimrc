let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
let base16colorspace=256  " Access colors present in 256 colorspace
let &t_ut=''

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive' "git integration
Plug 'wellle/targets.vim'

let g:ale_completion_enabled = 1 " style fixer
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['autopep8']
\}
Plug 'dense-analysis/ale'

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
Plug 'chriskempson/base16-vim'
Plug 'fladson/vim-kitty'

Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown'

Plug 'https://github.com/junegunn/limelight.vim'
Plug 'https://github.com/junegunn/goyo.vim'

Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'https://github.com/tools-life/taskwiki'

Plug 'preservim/nerdtree'

call plug#end()


" set background=dark

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


"==============================="
"           COMMANDS            "
"==============================="

" Navigate wrapped lines
nmap <silent> <C-j> gj
nmap <silent> <C-k> gk

" Enable spell checking
map <leader>s :setlocal spell! spelllang=en_ca<CR>

" Shellcheck
map <leader>S :!clear && shellcheck %<CR>

" compiling:
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" paste buffer:
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

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

"==============================="
"           COLORSCH            "
"==============================="
"
" TODO: rename back to something generic so it's possible to switch dynamic
colorscheme base16-rose-pine-moon-b16

highlight Normal guibg=NONE ctermbg=NONE
highlight Comment guibg=NONE ctermbg=NONE
highlight Constant guibg=NONE ctermbg=NONE
highlight Special guibg=NONE ctermbg=NONE
highlight Identifier guibg=NONE ctermbg=NONE
highlight Statement guibg=NONE ctermbg=NONE
highlight PreProc guibg=NONE ctermbg=NONE
highlight Type guibg=NONE ctermbg=NONE
highlight Underlined guibg=NONE ctermbg=NONE
highlight Todo guibg=NONE ctermbg=NONE
highlight String guibg=NONE ctermbg=NONE
highlight Function guibg=NONE ctermbg=NONE
highlight Conditional guibg=NONE ctermbg=NONE
highlight Repeat guibg=NONE ctermbg=NONE
highlight Operator guibg=NONE ctermbg=NONE
highlight Structure guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight CursorLineNr guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE

highlight CursorColumn cterm=NONE ctermbg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE
highlight StatusLine guibg=NONE ctermbg=NONE

set cursorline


"==============================="
"           NERDTree            "
"==============================="
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
