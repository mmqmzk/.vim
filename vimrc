set number
set relativenumber
set autoindent
set showcmd
set tabstop=2
set shiftwidth=2
set scrolloff=4
set softtabstop=2
set backspace=indent,eol,start
set showmatch
set hlsearch
set incsearch
set smartcase
set ruler
set expandtab
set encoding=utf-8

set nocompatible
syntax on

call plug#begin(expand('<sfile>:h') . '/bundle')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'altercation/vim-colors-solarized'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'valloric/youcompleteme'
Plug 'bkad/CamelCaseMotion'
call plug#end()

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|vscode))|(node_modules|typings)$',
  \ 'file': '\v\.(exe|so|dll|log|doc|docx|xls|xlsx|class|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1

" nerdtree
noremap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" sneak
" let g:sneak#label = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" CamelCaseMotion
map ]w <Plug>CamelCaseMotion_w
map [w <Plug>CamelCaseMotion_b
map ]e <Plug>CamelCaseMotion_e
map [e <Plug>CamelCaseMotion_ge
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie
imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w

"easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_space_jump_first = 1
nmap <space>/ <Plug>(easymotion-sn)
omap <space>/ <Plug>(easymotion-tn)
nmap <space>s <Plug>(easymotion-jumptoanywhere)
nmap <space>f <Plug>(easymotion-bd-f)
nmap <space>t <Plug>(easymotion-bd-t)
nmap <space>w <Plug>(easymotion-bd-w)
nmap <space>W <Plug>(easymotion-bd-W)
nmap <space>e <Plug>(easymotion-bd-e)
nmap <space>E <Plug>(easymotion-bd-E)
nmap <space>n <Plug>(easymotion-n)
nmap <space>N <Plug>(easymotion-N)
nmap <space>j <Plug>(easymotion-bd-jk)
nmap <space>k <Plug>(easymotion-bd-jk)
nmap <space>l <Plug>(easymotion-lineanywhere)
nmap <space>h <Plug>(easymotion-lineanywhere)
nmap <space>c <Plug>(easymotion-bd-f2)
nmap <space>C <Plug>(easymotion-bd-t2)
nmap <space>; <Plug>(easymotion-next)
nmap <space>, <Plug>(easymotion-prev)
nmap <space>. <Plug>(easymotion-repeat)

" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" indentLine
let g:indentLine_enabled = 1

" yankstack
map <m-y> <Plug>yankstack_substitute_older_paste
map <m-s-y> <Plug>yankstack_substitute_newer_paste

" vim-operator-replace
map _ <Plug>(operator-replace)

"key mapping
inoremap <s-cr> <c-o>o
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
inoremap <c-y> <c-o>cc

nnoremap Y y$

noremap <F8> :let @/ = ""<cr>
noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P
noremap <space>y "+y
noremap <space>p "+p
noremap <space>P "+P

vnoremap < <gv
vnoremap > >gv
vnoremap p pgvy

noremap <c-l> <esc>:bnext<cr>
noremap <c-h> <esc>:bprevious<cr>
noremap <c-tab> <esc>:bnext<cr>
noremap <c-s-tab> <esc>:bprevious<cr>
nnoremap <leader>d <esc>:bdelete<cr>
nnoremap <space>d <esc>:bdelete<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <space>b :CtrlPBuffer<cr>
nnoremap <space><cr> :nohlsearch<cr>

nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <leader>r viwpgvy
nnoremap <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

noremap <F12> :YcmCompleter GoTo<cr>
noremap <F9> :YcmCompleter GoToDeclaration<cr>
noremap <F10> :YcmCompleter GoToDefinition<cr>
noremap <F7> :YcmCompleter GoToReferences<cr>

noremap <F6> :YcmCompleter GetDoc<cr>

if (has('gui_running'))
    set background=dark
    color solarized
    set guifont=YaHei\ consolas\ Hybrid:h10
    set lines=36 columns=120
    set cursorcolumn
    set cursorline
    set go=
endif
