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

" for i in [68, 127]
  " let c = nr2char(i)
  " execute "map \e".c." <M-".c.">"
  " execute "map! \e".c." <M-".c.">"
" endfor

let g:AutoPairsMapCh = 0

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
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'michaeljsmith/vim-indent-object'
Plug 'svermeulen/vim-yoink'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'tpope/vim-repeat'
" Plug 'justinmk/vim-sneak'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'valloric/youcompleteme'
Plug 'bkad/CamelCaseMotion'
Plug 'svermeulen/vim-subversive'
call plug#end()

" Ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_match_window = 'min:4,max:72'
if executable('fd')
  let g:ctrlp_user_command = 'fd -H . %s '
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif
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

" Nerdtree
noremap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDConnenter
let g:NERDSpaceDelims = 1
map <space>i <Plug>NERDCommenterInvert
map gc <Plug>NERDCommenterInvert


" Sneak
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

" CamelCaseMotion
map ]w <Plug>CamelCaseMotion_w
map [w <Plug>CamelCaseMotion_b
map ]e <Plug>CamelCaseMotion_e
map [e <Plug>CamelCaseMotion_ge
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie
imap <s-left> <c-o><Plug>CamelCaseMotion_b
imap <s-right> <c-o><Plug>CamelCaseMotion_w
imap <c-b> <c-o>d<Plug>CamelCaseMotion_b
imap <c-d> <c-o>d<Plug>CamelCaseMotion_w
inoremap  <c-r>=AutoPairsDelete()<cr><c-w>
inoremap [3;5~ <c-o>dw

" Easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
map <space>/ <Plug>(easymotion-sn)
omap <space>/ <Plug>(easymotion-sn)
map <space>s <Plug>(easymotion-jumptoanywhere)
map <space>f <Plug>(easymotion-f)
map <space>F <Plug>(easymotion-F)
map <space>t <Plug>(easymotion-t)
map <space>T <Plug>(easymoTion-t)
map <space>w <Plug>(easymotion-w)
map <space>W <Plug>(easymotion-W)
map <space>e <Plug>(easymotion-e)
map <space>E <Plug>(easymotion-E)
map <space>ge <Plug>(easymotion-ge)
map <space>gE <Plug>(easymotion-gE)
map <space>n <Plug>(easymotion-n)
map <space>N <Plug>(easymotion-N)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>l <Plug>(easymotion-lineanywhere)
map <space>h <Plug>(easymotion-lineanywhere)
map <space>c <Plug>(easymotion-f2)
map <space>x <Plug>(easymotion-t2)
map <space>; <Plug>(easymotion-next)
map <space>, <Plug>(easymotion-prev)
map <space>. <Plug>(easymotion-repeat)

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

" IndentLine
let g:indentLine_enabled = 1

" MultipleCursor
let g:multi_cursor_select_all_word_key = '<c-l>'
let g:multi_cursor_select_all_key = '<c-h>'

" Yoink
let g:yoinkSwapClampAtEnds = 0
let g:yoinkIncludeDeleteOperations = 1
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap gy <plug>(YoinkPostPasteSwapBack)
nmap gY <plug>(YoinkPostPasteSwapForward)

" Subversive
let g:subversiveCurrentTextRegiste = 'r'
map gs <plug>(SubversiveSubstitute)
nmap gss <plug>(SubversiveSubstituteLine)
nmap gS <plug>(SubversiveSubstituteToEndOfLine)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

" Key mapping
inoremap <s-cr> <c-o>o
inoremap <c-a> <c-o>^
inoremap <c-e> <c-o>$
inoremap <c-k> <c-o>D
noremap <F2> :redraw<cr>

cnoremap w!! w !sudo tee > /dev/null %

if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --smart-case
endif

let g:ag_prg="ag --vimgrep --smart-case --hidden"

nnoremap K :grep! -s '<c-r><c-w>' .<cr>:cwindow<cr>
vnoremap K y:grep! -s -F '<c-r>0' .<cr>:cwindow<cr>

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

nmap <leader>y "+y
nmap <leader>p "+p
nmap <leader>P "+P
nmap <space>y "+y
nmap <space>p "+p
nmap <space>P "+P

nnoremap gz `[v`]
inoremap <c-f> <c-o>^

vnoremap < <gv
vnoremap > >gv
vnoremap p pgvy
vnoremap v ^$h
vnoremap * y/\V<c-r>0<cr>
vnoremap # y?\V<c-r>0<cr>

nnoremap <c-j> <esc>:bnext<cr>
nnoremap <c-k> <esc>:bprevious<cr>

nnoremap <leader>d <esc>:bdelete<cr>
nnoremap <space>d <esc>:bdelete<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <space>b :CtrlPBuffer<cr>

noremap <F8> :let @/ = ""<cr>
nnoremap <leader><cr> :nohlsearch<cr>
nnoremap <space><cr> :nohlsearch<cr>

nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <leader>r viwpgvy
nnoremap <space>r viwpgvy
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
