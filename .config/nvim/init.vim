" Author: Rocky Zhang <yanzhang0219@gmail.com>
" GitHub: https://github.com/rockyzhang24

" ---------- [ General ] ---------- {{{

let base16colorspace=256
let &t_ut=''

set nocompatible
set number
set relativenumber
set cursorline
set cursorlineopt=number,screenline
" set foldcolumn=1
set hidden  " Allow buffer switch without saving
set wrap
set autoindent
" set clipboard+=unnamedplus
set scrolloff=5
set sidescrolloff=5
set autoread
set noshowmode
set showcmd
set wildmenu
set wildmode=longest:full,full
set textwidth=80
set colorcolumn=80
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,precedes:❮,extends:❯
set fillchars=fold:\ ,eob:\ ,msgsep:‾,
set foldenable
set foldmethod=indent
set foldlevel=99
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr() " treesitter based folding
set completeopt=menu,menuone,noselect
set ttimeoutlen=50
set timeoutlen=500
set shortmess+=a shortmess+=c shortmess+=I
set inccommand=split
set updatetime=250
set laststatus=2
set showtabline=2
set matchpairs+=<:>
set splitbelow
set splitright
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1 " use the value of 'shiftwidth'
set shiftround
set hlsearch
set incsearch
set ignorecase
set smartcase
set title
set titlestring=%t%(\ %M%)%<%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set titlelen=15
set diffopt+=vertical diffopt+=algorithm:patience
set noswapfile
set signcolumn=yes:2
set spelllang=en_us
set pumblend=5
set pumheight=20
set winblend=5
set winminwidth=10
set grepprg=rg\ --vimgrep\ --smart-case\ $*
set grepformat=%f:%l:%c:%m
set breakindent
set breakindentopt=shift:2
set showbreak=↳
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.log,*.pyc,*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/logs/*,*/dist/*,*/tmp/*
set confirm
set undofile " presistent undo (use set undodir=... to change the undodir, default is ~/.local/share/nvim/undo)
set nrformats=octal,bin,hex,unsigned,alpha
set sessionoptions+=terminal sessionoptions+=globals
set isfname-==

" Avoid highlighting the last search when sourcing vimrc
exec "nohlsearch"

" Terminal
let g:neoterm_autoscroll = '1'

" Dress up quickfix window
lua require('qf')

" }}}

" ---------- [ Colors ] ---------- {{{

set termguicolors
set background=dark

colorscheme base16
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
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE
highlight StatusLine guibg=NONE ctermbg=NONE
highlight VertSplit ctermbg=NONE guibg=NONE ctermfg=NONE guifg=NONE
highlight ColorColumn ctermbg=NONE guibg=NONE
" }}}

" ---------- [ vimwiki ] ---------- {{{

try
    source ~/vimwiki/vimwiki.vim
    silent! iunmap <buffer> <Tab>
catch
    " no such file? no problem; just ignore it.
endtry

" }}}

" ---------- [ fzf ] ---------- {{{

" nnoremap <silent> <leader>o :Files<CR>
" nnoremap <silent> <leader>O :Files!<CR>
" nnoremap <silent> <leader> :History:<CR>
" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>` :Marks<CR>
" nnoremap <silent> <F1> :Helptags<CR>
" inoremap <silent> <F1> <ESC>:Helptags<CR>
" noremap <silent> <leader>; :Commands<CR>
" nnoremap <silent> <leader>l :BLines<CR>
" inoremap <silent> <F3> <ESC>:Snippets<CR>
" nnoremap <silent> <F3> :Snippets<CR>

" }}}

" ---------- [ Autocommands ] ---------- {{{

augroup general
  autocmd!
  " Jump to the position when you last quit
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &filetype !~# 'commit' |
        \   exe "normal! g'\"" |
        \ endif
  " Automatically equalize splits when Vim is resized
  autocmd VimResized * wincmd =
  " Make it not be overwritten by the default setting of neovim
  autocmd FileType * set formatoptions-=t formatoptions-=o formatoptions-=r textwidth=80
augroup END

" Highlight selection on yank
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="Substitute", timeout=300})
augroup END

" Neovim builtin terminal
augroup nvim_terminal
  autocmd!
  " Automatically start insert mode when enter terminal, and disable line number and indentline
  autocmd TermOpen term://* startinsert |
        \ setlocal nonumber norelativenumber signcolumn=no |
        \ IndentBlanklineDisable
  autocmd BufWinEnter,WinEnter term://* startinsert
augroup END

" Automatic toggling between 'hybrid' and absolute line numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Disable syntax highlighting for some filetypes if they are too long
augroup syntax_off
  autocmd!
  autocmd FileType yaml if line('$') > 500 | setlocal syntax=OFF | endif
augroup END

" Quit vim (or close the tab) automatically if all buffers left are auxiliary
function! s:AutoQuit() abort
  let l:filetypes = ['aerial', 'NvimTree', 'tsplayground', 'query']
  let l:tabwins = nvim_tabpage_list_wins(0)
  for w in l:tabwins
    let l:buf = nvim_win_get_buf(w)
    let l:buf_ft = getbufvar(l:buf, '&filetype')
    if index(l:filetypes, buf_ft) == -1
      return
    endif
  endfor
  call s:Quit()
endfunction

function! s:Quit() abort
  if tabpagenr('$') > 1
    tabclose
  else
    qall
  endif
endfunction

augroup auto_quit
  autocmd!
  autocmd BufEnter * call s:AutoQuit()
augroup END

" I manage my dotfiles using a bare repository. To make Vim recognize them and git related plugins
" work on them, the environment variables should be set to indicate the locations of git-dir and
" work-tree when we enter the dotfile buffer. Don't forget to reset them when we enter other buffers,
" otherwise the normal repository will not be recognized.
function! s:SetGitEnv() abort
  let cur_file = expand('%')
  " Only set the Git env for the buffer containing a real file
  if !filereadable(cur_file)
    return
  endif
  let git_dir = expand('~/Repositories/dotfiles/')
  let work_tree = expand('~')
  let jib = jobstart(["git", "--git-dir", git_dir, "--work-tree", work_tree, "ls-files", "--error-unmatch", cur_file])
  let ret = jobwait([jib])[0]
  if ret == 0
    let $GIT_DIR = git_dir
    let $GIT_WORK_TREE = work_tree
  else
    unlet $GIT_DIR
    unlet $GIT_WORK_TREE
  endif
endfunction

augroup personal
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter * call s:SetGitEnv()
augroup END

" }}}

" ---------- [ Commands ] ---------- {{{

" Change indentation for the current buffer
" `:Reindent cur_indent new_indent`, E.g., `:Reindent 2 4` for changing the
" indentation from 2 to 4

" command -nargs=+ Reindent call utils#reindent(<f-args>)

" }}}

" ---------- [ Abbreviation ] ---------- {{{

function! s:SetupCommandAbbrs(from, to) abort
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call s:SetupCommandAbbrs('T', 'tabedit')

" }}}

" ---------- [ Mappings ] ---------- {{{

" Misc {{{

let mapleader=" "
nnoremap <Space> <NOP>

" The normal `,` is used as a leader key for lsp mappings
nnoremap <Leader>, ,

" Save and quit
nnoremap <silent> <Leader>ww :<C-u>update<CR>
nnoremap <silent> <Leader>q :<C-u>x<CR>
nnoremap <silent> <Leader>Q :<C-u>qa!<CR>

" Smarter j and k navigation
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Go to the start and end of the line easier
noremap H ^
noremap L $

" Move the selections up and down with corresponding indentation
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
inoremap <M-j> <Esc>:m .+1<CR>==a
inoremap <M-k> <Esc>:m .-2<CR>==a

" Fast insert a place holder
inoremap ,p <++>

" Jump to the next '<++>' and edit it
nnoremap <silent> <Leader><Leader> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <silent> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l

" Indent
xnoremap < <gv
xnoremap > >gv

" Delete but not save to a register
nnoremap <Leader>d "_d
xnoremap <Leader>d "_d
nnoremap <Leader>D "_D
nnoremap <Leader>dd "_dd
nnoremap c "_c
xnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" Make dot work over visual line selections
xnoremap . :norm.<CR>

" Execute a macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" Clone current paragraph
nnoremap cp yap<S-}>p

" Remove all the trailing whitespaces
nnoremap <silent> _$ :call utils#Preserve("%s/\\s\\+$//e")<CR>;

" Format the whole file
nnoremap <silent> _= :call utils#Preserve("normal gg=G")<CR>;

" Navigation in the argument list
nnoremap <silent> [a :<C-u>previous<CR>
nnoremap <silent> ]a :<C-u>next<CR>
nnoremap <silent> [A :<C-u>first<CR>
nnoremap <silent> ]A :<C-u>last<CR>

" Navigation in the buffer list
nnoremap <silent> [b :<C-u>bprevious<CR>
nnoremap <silent> ]b :<C-u>bnext<CR>
nnoremap <silent> [B :<C-u>bfirst<CR>
nnoremap <silent> ]B :<C-u>blast<CR>

" Navigation in the quickfix list
nnoremap <silent> [q :<C-u>cprevious<CR>zv
nnoremap <silent> ]q :<C-u>cnext<CR>zv
nnoremap <silent> [Q :<C-u>cfirst<CR>zv
nnoremap <silent> ]Q :<C-u>clast<CR>zv

" Navigation in the location list
nnoremap <silent> [l :<C-u>lprevious<CR>zv
nnoremap <silent> ]l :<C-u>lnext<CR>zv
nnoremap <silent> [L :<C-u>lfirst<CR>zv
nnoremap <silent> ]L :<C-u>llast<CR>zv

" Navigate in the tabs
nnoremap <silent> [t :<C-u>tabprevious<CR>
nnoremap <silent> ]t :<C-u>tabnext<CR>
nnoremap <silent> [T :<C-u>tabfirst<CR>
nnoremap <silent> ]T :<C-u>tablast<CR>

" Toggle spell checking
nnoremap <silent> \S :setlocal spell! spelllang=en_us<CR>:set spell?<CR>

" Toggle wrap
nnoremap <silent> \w :set wrap!<CR>:set wrap?<CR>

" Toggle relativenumber
nnoremap <silent> \r :call toggle#ToggleRelativeNum()<CR>

" Toggle quickfix window
nnoremap <silent> \q :call toggle#ToggleQuickFix()<CR>
nnoremap <silent> \l :call toggle#ToggleLocationList()<CR>

" Insert blank lines above or below the current line and preserve the cursor position
nnoremap <expr> [<Space> 'm`' . v:count . 'O<Esc>``'
nnoremap <expr> ]<Space> 'm`' . v:count . 'o<Esc>``'

" Open a line above or below the current line
inoremap <C-CR> <C-o>O
inoremap <S-CR> <C-o>o

" Move the view horizontally when nowrap is set
nnoremap zl 10zl
nnoremap zh 10zh

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
" }}}

" Copy and paste {{{

" Copy
nnoremap Y y$
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

" Copy the entire buffer
nnoremap <silent> y% :<C-u>%y<CR>
nnoremap <silent> Y% :<C-u>%y +<CR>

" Paste and then format
nnoremap p p=`]

" Paste over the selected text
xnoremap p "_c<Esc>p

" Select the last changed (or pasted) text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" " Paste non-linewise text above or below current cursor
nnoremap <Leader>p m`o<Esc>p``
nnoremap <Leader>P m`O<Esc>p``

" }}}

" Buffer {{{

" Switch between the current and the last buffer
nnoremap <Backspace> <C-^>

" Delete the current buffer and switch back to the previous one
nnoremap <silent> <Leader>bd :<C-u>bprevious <Bar> bdelete #<CR>

" Delete all the other unmodified buffers
nnoremap <silent> <Leader>bD :call utils#BufsDel()<CR>

" }}}

" Window {{{

" Focus movement around windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Scroll the other window
nnoremap <M-d> <C-w>w<C-d><C-w>w
nnoremap <M-u> <C-w>w<C-u><C-w>w
inoremap <M-d> <Esc><C-w>w<C-d><C-w>wa
inoremap <M-u> <Esc><C-w>w<C-u><C-w>wa

" Go to the previous window
nnoremap <C-p> <C-w>p

" Create a split window
nnoremap <silent> <Leader>- :split<CR>
nnoremap <silent> <Leader>\ :vsplit<CR>

" Change vertical to horizontal
nnoremap <Leader>w- <C-w>t<C-w>K

" Change horizontal to vertical
nnoremap <Leader>w\ <C-w>t<C-w>H

" Move current window to new tab
nnoremap <Leader>wt <C-w>T

" Sizing
nnoremap <Leader><Down> <C-w>5-
nnoremap <Leader><Up> <C-w>5+
nnoremap <Leader><Left> <C-w>5<
nnoremap <Leader><Right> <C-w>5>

" Balance size
nnoremap <Leader>= <C-w>=

" }}}

" Tab {{{

" Open a new tab with an empty window
nnoremap <silent> <Leader>tn :$tabnew<CR>

" Close the current tab
nnoremap <silent> <Leader>tc :tabclose<CR>

" Close all other tabs
nnoremap <silent> <Leader>to :tabonly<CR>

" Move the current tab to the left or right
nnoremap <silent> <Leader>t, :-tabmove<CR>
nnoremap <silent> <Leader>t. :+tabmove<CR>

" }}}

" Searching {{{

" Clean search highlighting
nnoremap <silent> <Leader>/ :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" n for searching forward and N for searching backward regardless of / or ?
nnoremap <expr> n (v:searchforward ? 'nzzzv' : 'Nzzzv')
nnoremap <expr> N (v:searchforward ? 'Nzzzv' : 'nzzzv')

" Make * and # search for the current selection
xnoremap * :<C-u>call utils#VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call utils#VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" Grep operator (now using vim-grepper instead)
" nnoremap <silent> \g :<C-u>set operatorfunc=utils#GrepOperator<CR>g@
" xnoremap <silent> \g :<C-u>call utils#GrepOperator(visualmode())<CR>

" Find and replace
nnoremap <Leader>r :%s/
xnoremap <Leader>r :s/

" }}}

" Command-line {{{

" Cursor movement in command line (Emacs style)
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap ∫ <S-Left>
cnoremap ƒ <S-Right>

" Ctrl-o to open command-line window
set cedit=\<C-o>

" Get the full path of the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" }}}

" Terminal {{{

" Close the current terminal window
tnoremap <M-c> <C-\><C-n>:quit<CR>

" Close and delete the current terminal buffer
tnoremap <M-d> <C-\><C-n>:bdelete!<CR>

" Back to normal mode in the terminal buffer
tnoremap <Esc> <C-\><C-n>

" Switching between split windows
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

" In terminal mode, use <M-r> to simulate <C-r> in insert mode for inserting the content of a register
" Reference: http://vimcasts.org/episodes/neovim-terminal-paste/
tnoremap <expr> <M-r> '<C-\><C-n>"' . nr2char(getchar()) . 'pi'

" }}}

" }}}

" ---------- [ Plugins ] ---------- {{{

" Minpac plugin manager (load minpac on demand)
function! PackInit() abort
  packadd minpac
  call minpac#init({'progress_open': 'vertical', 'status_open': 'vertical', 'status_auto': 'TRUE'})

  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('nvim-lua/plenary.nvim')  " lua library used by other lua plugins
  call minpac#add('tami5/sqlite.lua')
  call minpac#add('numToStr/Comment.nvim')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('RRethy/vim-illuminate')
  call minpac#add('RRethy/vim-hexokinase', { 'do': 'make hexokinase' })
  call minpac#add('AndrewRadev/splitjoin.vim')  " gS and gJ for split and join
  call minpac#add('godlygeek/tabular')
  call minpac#add('lukas-reineke/indent-blankline.nvim')
  call minpac#add('mbbill/undotree')
  call minpac#add('mhinz/vim-startify')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('yanzhang0219/lualine.nvim')
  call minpac#add('akinsho/bufferline.nvim')
  call minpac#add('kevinhwang91/nvim-bqf')
  call minpac#add('junegunn/fzf', { 'do': 'packloadall! | call fzf#install()' })  " as a filter for bqf
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('kevinhwang91/nvim-hlslens')
  call minpac#add('tommcdo/vim-exchange') " cx{motion}, cxx (line), X (visual), cxc (clear), `.` is supported
  call minpac#add('kyazdani42/nvim-tree.lua')
  call minpac#add('t9md/vim-choosewin')
  call minpac#add('lewis6991/foldsigns.nvim')
  call minpac#add('gelguy/wilder.nvim', { 'do': 'let &rtp=&rtp | UpdateRemotePlugins' })
  call minpac#add('SmiteshP/nvim-gps')
  call minpac#add('tversteeg/registers.nvim')
  call minpac#add('ThePrimeagen/harpoon')
  call minpac#add('akinsho/toggleterm.nvim')
  call minpac#add('mg979/vim-visual-multi')
  call minpac#add('dstein64/nvim-scrollview')
  call minpac#add('phaazon/hop.nvim')
  call minpac#add('kevinhwang91/nvim-fFHighlight')

  " Telescope
  call minpac#add('nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' })  " sorter for telescope
  call minpac#add('nvim-telescope/telescope.nvim')

  " Text object
  call minpac#add('junegunn/vim-after-object')
  call minpac#add('michaeljsmith/vim-indent-object')
  call minpac#add('wellle/targets.vim')

  " LSP
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('j-hui/fidget.nvim')
  call minpac#add('stevearc/aerial.nvim')
  call minpac#add('kosayoda/nvim-lightbulb')
  call minpac#add('ray-x/lsp_signature.nvim')

  " Autocomplete
  call minpac#add('hrsh7th/nvim-cmp')
  call minpac#add('hrsh7th/cmp-nvim-lsp')
  call minpac#add('hrsh7th/cmp-buffer')
  call minpac#add('hrsh7th/cmp-path')
  call minpac#add('hrsh7th/cmp-cmdline')
  call minpac#add('hrsh7th/cmp-nvim-lua')
  call minpac#add('onsails/lspkind-nvim')

  " Snippets
  call minpac#add('L3MON4D3/LuaSnip')
  call minpac#add('saadparwaiz1/cmp_luasnip')

  " TeX
  call minpac#add('lervag/vimtex')
  call minpac#add('tpope/vim-dispatch')

  " Tree-sitter
  call minpac#add('nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'})
  call minpac#add('nvim-treesitter/playground')
  call minpac#add('nvim-treesitter/nvim-treesitter-textobjects')
  call minpac#add('JoosepAlviste/nvim-ts-context-commentstring')
  call minpac#add('mizlan/iswap.nvim')
  call minpac#add('p00f/nvim-ts-rainbow')
  call minpac#add('lewis6991/nvim-treesitter-context')
  call minpac#add('lewis6991/spellsitter.nvim')

  " Tags
  call minpac#add('ludovicchabant/vim-gutentags')
  call minpac#add('skywind3000/gutentags_plus')

  " Git
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('lewis6991/gitsigns.nvim')

  " Markdown
  call minpac#add('instant-markdown/vim-instant-markdown')

  " Icons
  call minpac#add('kyazdani42/nvim-web-devicons')

  " Color schemes
  call minpac#add('folke/tokyonight.nvim')
  call minpac#add('dracula/vim')
  call minpac#add('sainnhe/gruvbox-material')
  call minpac#add('EdenEast/nightfox.nvim')
  call minpac#add('rebelot/kanagawa.nvim')
  call minpac#add('bluz71/vim-nightfly-guicolors')

  " call minpac#add('chrisbra/unicode.vim')
  " call minpac#add('chriskempson/base16-vim')
  call minpac#add('fladson/vim-kitty')

  call minpac#add('junegunn/limelight.vim')
  call minpac#add('junegunn/goyo.vim')

  call minpac#add('vimwiki/vimwiki', { 'branch': 'dev'})
  call minpac#add('tools-life/taskwiki')
endfunction

" }}}

" ---------- [ Plugin config - viml ] ---------- {{{

" choosewin {{{

nmap  -  <Plug>(choosewin)
let g:choosewin_blink_on_land = 0
let g:choosewin_tabline_replace = 0

" }}}

" fugitive {{{

" Reference: http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
augroup fugitiveautocmd
  autocmd!

  " Use .. to go up to the parent directory if the buffer containing a git blob or tree
  autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif

  " Make bufferlist clean
  autocmd BufReadPost fugitive://* set bufhidden=delete

augroup END

" Mappings
" Use , as the leader key for git related stuff
nnoremap <silent> ,gs :Git<CR>

" }}}

" gutentags {{{

" Reference: https://zhuanlan.zhihu.com/p/36279445

" Tips: If we need the tags for a project not managed by vcs, we can touch a .root file under the project root folder
let g:gutentags_project_root = ['.git', '.root', '.project']

" Tag file name for ctags
let g:gutentags_ctags_tagfile = '.tags'

" Using both ctags and gtags
let g:gutentags_modules = []
if executable('ctags')  " the ctags file generated by gutentags will be prepended to 'tags' option
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope'] "'cscopeprg' will be set to gtags-cscope
endif

" Move tag files out of project dir to avoid being polluted
let g:gutentags_cache_dir = expand('~/.cache/tags')

" Options for ctags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']

" Disable connecting gtags database automatically (gutentags_plus will handle the database connection)
let g:gutentags_auto_add_gtags_cscope = 0

" Disable default maps
let g:gutentags_plus_nomap = 1

" Focus to quickfix window after searching
let g:gutentags_plus_switch = 1

" }}}

" harpoon {{{

nnoremap <silent> <Leader>ha :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent> \h :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent> <Leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <Leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <Leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <Leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

" }}}

" iswap {{{

" Use cx to be consistent with vim-exchange
nnoremap <silent> <Leader>cx <Cmd>ISwap<CR>

" }}}

" minpac {{{

function! s:PluginUpdate() abort
  " Unset the Git env to avoid git errors caused by minpac#update()
  unlet $GIT_DIR
  unlet $GIT_WORK_TREE
  call minpac#update()
endfunction

command! PluginUpdate source $MYVIMRC | call PackInit() | call s:PluginUpdate()
command! PluginDelete source $MYVIMRC | call PackInit() | call minpac#clean()

call s:SetupCommandAbbrs('pu', 'PluginUpdate')
call s:SetupCommandAbbrs('pd', 'PluginDelete')

" }}}

" vim-hexokinase {{{

let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

" Toggle
nnoremap \c :HexokinaseToggle<CR>

" }}}

" vim-illuminate {{{

let g:Illuminate_delay = 300

let g:Illuminate_ftblacklist = ['startify', 'qf', 'NvimTree', 'aerial']

" }}}

" vim-openbrowser.vim {{{

let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ----}}}

" vim-after-object {{{

augroup after-object
  autocmd!
  autocmd VimEnter * call after_object#enable([']', '['], '=', ':', '-', '#', ' ')
augroup END

" }}}

" vim-grepper {{{

let g:grepper = {}
let g:grepper.dir = 'repo,file'
let g:grepper.repo = ['.git', '.hg', '.svn']
let g:grepper.tools = ['rg', 'git']
let g:grepper.searchreg = 1
let g:grepper.prompt_mapping_tool = '<Leader>G'
let g:grepper.rg = {
      \ 'grepprg': 'rg -H --no-heading --vimgrep --smart-case',
      \ 'grepformat': '%f:%l:%c:%m,%f',
      \ 'escape': '\^$.*+?()[]{}|'
      \ }

" Operator
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)

nnoremap <Leader>G :Grepper<CR>

" }}}

" vim-visual-multi {{{

let g:VM_theme = 'iceblue'
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

" }}}

" startify {{{

let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Make vim-rooter works when a file is opened from startify
let g:startify_change_to_dir = 0

" Filter MRU files
let g:startify_skiplist = [
      \ 'tmp\..*',
      \ 'COMMIT_EDITMSG',
      \ ]

let g:startify_update_oldfiles = 1

" Devicons
lua << EOF
function _G.webDevIcons(path)
  local filename = vim.fn.fnamemodify(path, ':t')
  local extension = vim.fn.fnamemodify(path, ':e')
  return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
end
EOF

function! StartifyEntryFormat() abort
  return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
endfunction

" Header
let g:ascii = [
      \ ' _____  ___    _______    ______  ___      ___  __     ___      ___ ',
      \ '(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |',
      \ '|.\\   \    |(: ______) // ____  \\   \  //  / ||  |   \   \  //   |',
      \ '|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |   /\\  \/.    |',
      \ '|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |',
      \ '|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |',
      \ ' \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|',
      \ ]

let g:startify_custom_header = 'startify#pad(g:ascii + startify#fortune#boxed())'

" Enable cursorline
augroup starity
  autocmd User Startified setlocal cursorline
augroup END

" Go to the Startify buffer
nnoremap <silent> <Leader>sh :Startify<CR>

" Session management
nnoremap <silent> <Leader>ss :SSave<CR>
nnoremap <silent> <Leader>sl :SLoad<CR>
nnoremap <silent> <Leader>sc :SClose<CR>
nnoremap <silent> <Leader>sd :SDelete<CR>

" }}}

" tabular {{{

nnoremap <Leader>a :Tabularize /
xnoremap <Leader>a :Tabularize /

" Find extra config at ./after/plugin/tabular.vim

" }}}

" targets.vim {{{

" Text object surrounded by any opening and closing characters can be customized
" Ref: https://github.com/wellle/targets.vim#targetsmappingsextend
augroup define_object
  autocmd User targets#mappings#user call targets#mappings#extend({
        \ 'a': {'argument': [{'o':'(', 'c':')', 's': ','}]}
        \ })
augroup END

" }}}

" undotree {{{

let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_SplitWidth = 30

" Toggle undotree
nnoremap \u :UndotreeToggle<CR>

" }}}

" registers {{{

let g:registers_window_border = "rounded"

" }}}

" wilder {{{

" Wilder is activated by default but / and ? conflict with vm-regex-search (\\/) in
" vim-visual-multi. 
" - Set enable_cmdline_enter = 0 to make wilder not activate automatically, and
"   then press <Tab> will actvate it. 
" - Or actually I don't need wilder to take over / and ?, so I removed them from
"   modes.

" Set keymaps to be consitent with nvim-cmp
call wilder#setup({
      \ 'modes': [':'],
      \ 'enable_cmdline_enter': 1,
      \ 'accept_key': '<C-y>',
      \ 'reject_key': '<C-e>',
      \ })

" A helper function
function! s:shouldDisable(x)
  let l:cmd = wilder#cmdline#parse(a:x).cmd
  return l:cmd ==# 'Man' || a:x =~# 'Git fetch origin '
endfunction

" Use fuzzy matching instead of substring matching (file completion is supported
" as well)
" NOTE: The completion process for some commands like `Man` take a while and it
" is synchronously, so Neovim will block. We should check this and disable
" wilder for these commands, and Neovim's builtin wildmenu will be used as the
" fallback (Ref: https://github.com/gelguy/wilder.nvim/issues/107)
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
      \       wilder#check({-> getcmdtype() ==# ':'}),
      \       {ctx, x -> s:shouldDisable(x) ? v:true : v:false},
      \     ],
      \     wilder#python_file_finder_pipeline({
      \       'file_command': {_, arg -> arg[0] ==# '.' ? ['rg', '--files', '--hidden'] : ['rg', '--files']},
      \       'dir_command': {_, arg -> arg[0] ==# '.' ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline({
      \       'language': 'python',
      \       'fuzzy': 1,
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': wilder#python_fuzzy_pattern(),
      \       'sorter': wilder#python_difflib_sorter(),
      \       'engine': 're2',
      \     }),
      \   ),
      \ ])

" Customize the appearance
" Use popupmenu for command and wildmenu for search
call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \   'highlighter': wilder#basic_highlighter(),
      \   'border': 'rounded',
      \   'max_height': 15,
      \   'highlights': {
      \     'border': 'Normal',
      \     'default': 'Normal',
      \     'accent': wilder#make_hl('PopupmenuAccent', 'Normal', [{}, {}, {'foreground': '#f4468f'}]),
      \   },
      \   'left': [
      \     ' ', wilder#popupmenu_devicons(),
      \   ],
      \   'right': [
      \     ' ', wilder#popupmenu_scrollbar(),
      \   ],
      \ })),
      \
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': wilder#basic_highlighter(),
      \   'highlights': {
      \     'accent': wilder#make_hl('WildmenuAccent', 'StatusLine', [{}, {}, {'foreground': '#f4468f'}]),
      \   },
      \ }),
      \ }))

" }}}
"
" }}}

" ---------- [ Plugin config - lua ] ---------- {{{

lua require('plugin_config.aerial')
lua require('plugin_config.bqf')
lua require('plugin_config.bufferline')
lua require('plugin_config.cmp')
lua require('plugin_config.comment')
lua require('plugin_config.fidget')
lua require('plugin_config.ffhighlight')
lua require('foldsigns').setup()
lua require('plugin_config.gitsigns')
lua require('plugin_config.hop')
lua require('plugin_config.indent')
lua require('plugin_config.lualine')
lua require('plugin_config.luasnip.luasnip-config')
lua require('plugin_config.lightbulb')
lua require('plugin_config.lsp-signature')
lua require('plugin_config.hlslens')
lua require('plugin_config.lsp.lsp-config')
lua require('plugin_config.nvim-ts-rainbow')
lua require('plugin_config.nvim-tree')
lua require('plugin_config.scrollbar')
lua require('plugin_config.treesitter')
lua require('plugin_config.treesitter-context')
lua require('plugin_config.nvim-gps')
lua require('plugin_config.telescope.telescope-config')
lua require('plugin_config.spellsitter')
lua require('plugin_config.toggleterm')

" }}}
