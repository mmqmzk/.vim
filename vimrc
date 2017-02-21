set number
set relativenumber
set autoindent
set showcmd
set tabstop=4
set shiftwidth=4
set scrolloff=4
set softtabstop=4
set backspace=indent,eol,start
set showmatch
set hlsearch
set incsearch
set smartcase
set ruler
set expandtab
set go=
set cursorcolumn
set encoding=utf-8

set nocompatible
syntax on

call plug#begin(fnamemodify(expand('<sfile>'), ':h').'/bundle')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'moll/vim-node'
Plug 'Lokaltog/vim-easymotion'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'
call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1

" neocomplcache
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" nerdtree
noremap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" easy motion
let g:EasyMotion_smartcase = 1
noremap <leader><leader>/ <Plug>(easymotion-sn)
onoremap <leader><leader>/ <Plug>(easymotion-tn)
noremap <leader><leader>j <Plug>(easymotion-j)
noremap <leader><leader>k <Plug>(easymotion-k)
noremap <leader><leader>l <Plug>(easymotion-lineforward)
noremap <leader><leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" neosnippet
inoremap <C-k> <Plug>(neosnippet_expand_or_jump)
snoremap <C-k> <Plug>(neosnippet_expand_or_jump)
xnoremap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
inoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
snoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" incsearch
noremap /  <Plug>(incsearch-forward)
noremap ?  <Plug>(incsearch-backward)
noremap g/ <Plug>(incsearch-stay)

"key mapping
inoremap <c-cr> <esc>o
inoremap <s-cr> <esc>O
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-[> <esc>
inoremap <c-]> <esc>
inoremap <c-w> <esc>dbs
inoremap <c-u> <esc>d^s
inoremap <c-k> <esc>C
inoremap <c-y> <esc>cc
noremap Y y$
noremap <F8> :let @/=""<CR>
noremap <unique> <leader>y "+y
noremap <unique> <leader>p "+p
noremap <unique> <leader>P "+P
vnoremap <unique> < <gv
vnoremap <unique> > >gv
noremap <c-l> :bnext<cr>
noremap <c-h> :bprevious<cr>
noremap <Leader>bd :bdelete<cr>
noremap <unique> <Up> gk
noremap <unique> <Down> gj
noremap <leader>r viwpyiw
noremap <leader>z :CtrlPBuffer<cr>
nnoremap <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>
if (has('gui_running'))
    set background=dark
    color solarized
    set guifont=YaHei\ consolas\ Hybrid:h10
    set lines=36 columns=120
endif
