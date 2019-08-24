set number
set relativenumber
set autoindent
set smartindent
set showcmd
set showmode
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
set timeoutlen=500
set ttimeoutlen=100
set nocompatible
set autoread
set autowrite
set hidden
syntax on
filetype plugin indent on

" for i in range(97,122)
  " let c = nr2char(i)
  " execute "map \e".c." <M-".c.">"
  " execute "map! \e".c." <M-".c.">"
" endfor

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
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'bkad/CamelCaseMotion'
Plug 'svermeulen/vim-subversive'
call plug#end()

" Ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'min:4,max:72'
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn|vscode))|(node_modules|typings)$',
  \ 'file': '\v\.(exe|so|dll|log|doc|docx|xls|xlsx|class|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Airline
let g:airline_theme='angr'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
inoremap <expr><c-g> neocomplcache#undo_completion()

" Nerdtree
noremap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDSpaceDelims = 1
map <space>i <Plug>NERDCommenterInvert
map gc <Plug>NERDCommenterInvert


" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" CamelCaseMotion
map ]w <Plug>CamelCaseMotion_w
map [w <Plug>CamelCaseMotion_b
map ]e <Plug>CamelCaseMotion_e
map [e <Plug>CamelCaseMotion_ge
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie
imap <S-Left> <C-o><Plug>CamelCaseMotion_b
imap <S-Right> <C-o><Plug>CamelCaseMotion_w

" Easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
map <space>/ <Plug>(easymotion-sn)
omap <space>/ <Plug>(easymotion-tn)
map <space>s <Plug>(easymotion-jumptoanywhere)
map <space>f <Plug>(easymotion-bd-f)
map <space>t <Plug>(easymotion-bd-t)
map <space>w <Plug>(easymotion-bd-w)
map <space>W <Plug>(easymotion-bd-W)
map <space>e <Plug>(easymotion-bd-e)
map <space>E <Plug>(easymotion-bd-E)
map <space>n <Plug>(easymotion-n)
map <space>N <Plug>(easymotion-N)
map <space>j <Plug>(easymotion-bd-jk)
map <space>k <Plug>(easymotion-bd-jk)
map <space>l <Plug>(easymotion-lineanywhere)
map <space>h <Plug>(easymotion-lineanywhere)
map <space>c <Plug>(easymotion-bd-f2)
map <space>x <Plug>(easymotion-bd-t2)
map <space>; <Plug>(easymotion-next)
map <space>, <Plug>(easymotion-prev)
map <space>. <Plug>(easymotion-repeat)

" Neosnippet
" imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>" 

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

" IndentLine
let g:indentLine_enabled = 1

map <c-y> <Plug>yankstack_substitute_older_paste
map <c-e> <Plug>yankstack_substitute_newer_paste

" Subversive
map gr <plug>(SubversiveSubstitute)
nmap grr <plug>(SubversiveSubstituteLine)
nmap gR <plug>(SubversiveSubstituteToEndOfLine)


" Key mapping
inoremap <s-cr> <c-o>o
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
inoremap <c-k> <c-o>D

cnoremap w!! w !sudo tee % > /dev/null

set grepprg=ag\ --vimgrep\ --hidden
let g:ag_prg="ag --vimgrep --smart-case --hidden"

nnoremap K :grep! -s -r '\b<c-r><c-w>\b' .<cr>:cwindow<cr>
vnoremap K y:grep! -s -r -F '<c-r>0' .<cr>:cwindow<cr>

nnoremap Y y$
nnoremap [0 :cfirst<cr>
nnoremap ]0 :clast<cr>
nnoremap [o :copen<cr>
nnoremap ]o :cclose<cr>
nnoremap [c :cprevious<cr>
nnoremap ]c :cnext<cr>
nnoremap [9 :lfirst<cr>
nnoremap ]9 :llast<cr>
nnoremap [q :lopen<cr>
nnoremap ]q :lclose<cr>
nnoremap [l :lprevious<cr>
nnoremap ]l :lnext<cr>

nnoremap x "_x
nnoremap xp xp
vnoremap x "_x
nnoremap s "_s
vnoremap s "_s

noremap <leader>y "+y
noremap <leader>p "+p
noremap <leader>P "+P
noremap <space>y "+y
noremap <space>p "+p
noremap <space>P "+P

nnoremap gz `[v`]

vnoremap < <gv
vnoremap > >gv
vnoremap p pgvy
vnoremap v ^$
vnoremap * y/\V<c-r>0<cr>
vnoremap # y?\V<c-r>0<cr>

noremap <c-l> <esc>:bnext<cr>
noremap <c-h> <esc>:bprevious<cr>
noremap <c-tab> <esc>:bnext<cr>
noremap <c-s-tab> <esc>:bprevious<cr>
nnoremap <leader>d <esc>:bdelete<cr>
nnoremap <space>d <esc>:bdelete<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <space>b :CtrlPBuffer<cr>
noremap <F8> :let @/ = ""<cr>
nnoremap <leader><cr> :nohlsearch<cr>
nnoremap <space><cr> :nohlsearch<cr>

nnoremap <Up> gk
nnoremap <Down> gj

"nnoremap <leader>r viwpgvy
"nnoremap <space>r viwpgvy
nnoremap <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

if (has('gui_running'))
    set background=dark
    color solarized
    set guifont=YaHei\ consolas\ Hybrid:h10
    set lines=36 columns=120
    set cursorcolumn
    set cursorline
    set go=
endif
