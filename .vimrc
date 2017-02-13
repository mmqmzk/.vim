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

call plug#begin('~/.vim/bundle')
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
map <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" easy motion
let g:EasyMotion_smartcase = 1
map <leader><leader>/ <Plug>(easymotion-sn)
omap <leader><leader>/ <Plug>(easymotion-tn)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"key mapping
imap <c-cr> <esc>o
imap <s-cr> <esc>O
imap <c-a> <esc>I
imap <c-e> <esc>A
imap <c-[> <esc>
imap <c-]> <esc>
imap <c-w> <esc>dbs
imap <c-u> <esc>d^s
map Y y$
map <F8> :let @/=""<CR>
map <unique> <leader>y "+y
map <unique> <leader>p "+p
map <unique> <leader>P "+P
vnoremap <unique> < <gv
vnoremap <unique> > >gv
noremap <c-l> :bnext<cr>
noremap <c-h> :bprevious<cr>
noremap <Leader>bd :bdelete<cr>
noremap <unique> <Up> gk
noremap <unique> <Down> gj
noremap <leader>r viwpyiw
noremap <leader>z :CtrlPBuffer<cr>
nnoremap <unique> <silent> <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>
if (has('gui_running'))
    set background=dark
    color solarized
    set guifont=YaHei\ consolas\ Hybrid:h10
    set lines=36 columns=120
endif
