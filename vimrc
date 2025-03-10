set number relativenumber
set autoindent smartindent
set showcmd
set tabstop=2
set shiftwidth=2
set scrolloff=2
set sidescrolloff=2
set softtabstop=2
set nojoinspaces
set backspace=indent,eol,start
set showmatch
set hlsearch
set incsearch
set ignorecase smartcase
set ruler
set expandtab
set smarttab
set encoding=utf-8
set timeoutlen=750
set ttimeoutlen=250
set nocompatible
set autoread
set autowrite
set hidden
" set mouse=a
" set ttymouse=xterm2
set wildmenu
syntax on
filetype plugin indent on

" for i in [68, 127]
  " let c = nr2char(i)
  " execute "map \e".c." <M-".c.">"
  " execute "map! \e".c." <M-".c.">"
" endfor

let g:AutoPairsMapCh = 0
let g:ale_completion_enabled = 1
let g:ale_set_balloons = 1

let g:FZF_BASE = expand('$FZF_BASE')
let g:use_fzf_instead_ctrl_p = executable('fzf') && isdirectory(g:FZF_BASE)

call plug#begin(expand('<sfile>:h') . '/bundle')
" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'Lokaltog/vim-easymotion'
" Plug 'scrooloose/syntastic'
" Plug 'valloric/youcompleteme'
Plug 'Yggdroot/indentLine'
Plug 'altercation/vim-colors-solarized'
Plug 'bkad/CamelCaseMotion'
Plug 'bling/vim-airline'
Plug 'chrisbra/matchit'
Plug 'dbakker/vim-paragraph-motion'
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-highlightedyank'
Plug 'michaeljsmith/vim-indent-object'
Plug 'scrooloose/nerdcommenter'
Plug 'svermeulen/vim-subversive'
Plug 'svermeulen/vim-yoink'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/argtextobj.vim'
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'deoplete-plugins/deoplete-zsh', {'for': 'zsh'}
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'moll/vim-node', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'html']}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
if g:use_fzf_instead_ctrl_p
  Plug 'junegunn/fzf', { 'dir': g:FZF_BASE }
  Plug 'junegunn/fzf.vim'
else
  Plug 'kien/ctrlp.vim'
  if executable('ag')
    Plug 'rking/ag.vim'
  endif
endif
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><c-n> deoplete#auto_complete()
inoremap <expr><c-g> deoplete#undo_completion()
inoremap <expr><c-c> deoplete#close_popup()

" ALE
" function! BashLangServProjRoot(buffer)
  " let l:git_path = ale#path#FindNearestDirectory(a:buffer, '.git')
  " let l:curr_dir = fnamemodify(bufname(a:buffer), ':h')
  " return !empty(l:git_path) ? fnamemodify(l:git_path, ':h:h') : l:curr_dir
" endfunction
" call ale#linter#Define('sh', {
      " \ 'name': 'bashls',
      " \ 'lsp': 'stdio',
      " \ 'executable': function('ale_linters#sh#language_server#GetExecutable'),
      " \ 'command': function('ale_linters#sh#language_server#GetCommand'),
      " \ 'project_root': function('BashLangServProjRoot'),
      " \ })
let g:ale_linters = {
      \ 'javascript': ['eslint', 'tsserver'],
      \ 'sh': ['language-server', 'shell', 'shellcheck', 'shfmt']
      \ }
let g:ale_linter_aliases = {'sh': ['sh', 'bash', 'zsh']}
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'sh': ['shfmt'],
      \ 'javascript': ['eslint', 'remove_trailing_lines', 'trim_whitespace'],
      \ 'json': ['jq', 'remove_trailing_lines', 'trim_whitespace'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_completion_symbols = {
      \ 'text': '',
      \ 'method': '',
      \ 'function': '',
      \ 'constructor': '',
      \ 'field': '',
      \ 'variable': '',
      \ 'class': '',
      \ 'interface': '',
      \ 'module': '',
      \ 'property': '',
      \ 'unit': 'unit',
      \ 'value': 'val',
      \ 'enum': '',
      \ 'keyword': 'keyword',
      \ 'snippet': '',
      \ 'color': 'color',
      \ 'file': '',
      \ 'reference': 'ref',
      \ 'folder': '',
      \ 'enum member': '',
      \ 'constant': '',
      \ 'struct': '',
      \ 'event': 'event',
      \ 'operator': '',
      \ 'type_parameter': 'type param',
      \ '<default>': 'v'
      \ }
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFunc
silent! call deoplete#custom#source('ale', 'rank', 999)
nmap <F2> <Plug>(ale_next_wrap)
nmap [1;2Q <Plug>(ale_previous_wrap)
nmap <F12> <Plug>(ale_go_to_definition)
nmap <c-F12> <Plug>(ale_go_to_type_definition)
nmap <F7> <Plug>(ale_find_references)
nmap <F6> <Plug>(ale_fix)
nmap gh <Plug>(ale_hover)
nmap <c-s-s> <Plug>(ale_lint)

if g:use_fzf_instead_ctrl_p
  " Fzf
  nnoremap <c-p> :Files<cr>
  nnoremap <leader>r :Buffers<cr>
  nnoremap <space>r :Buffers<cr>

  nmap <space><tab> <plug>(fzf-maps-n)
  xmap <space><tab> <plug>(fzf-maps-x)
  omap <space><tab> <plug>(fzf-maps-o)
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
else
  " Ctrlp
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'r'
  let g:ctrlp_match_window = 'min:4,max:72'
  if executable('fd')
    let g:ctrlp_user_command = 'fd --hidden . %s '
  elseif executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  endif
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](\.(git|hg|svn|vscode))|(node_modules|typings)$',
        \ 'file': '\v\.(exe|so|dll|log|doc|docx|xls|xlsx|class|swp)$',
        \ 'link': 'some_bad_symbolic_links',
        \ }
  nnoremap <leader>r :CtrlPBuffer<cr>
  nnoremap <space>r :CtrlPBuffer<cr>
endif

" Airline
let g:airline_theme='badwolf' " owo base16_3024 fruit_punch
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set noshowmode

" Nerdtree
noremap <F4> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")
      \ && b:NERDTreeType == "primary") | q | endif

" NERDConnenter
let g:NERDSpaceDelims = 1
map <space>i <Plug>NERDCommenterInvert
nmap <space>i <Plug>NERDCommenterInvertj
map gc <Plug>NERDCommenterInvert
map  <Plug>NERDCommenterInvertj
map  <Plug>NERDCommenterMinimal


" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" CamelCaseMotion
map ]w <Plug>CamelCaseMotion_w
map [w <Plug>CamelCaseMotion_b
map ]e <Plug>CamelCaseMotion_e
map [e <Plug>CamelCaseMotion_ge
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie
nmap <s-left> <Plug>CamelCaseMotion_b
nmap <s-right> <Plug>CamelCaseMotion_e
vmap <s-left> <Plug>CamelCaseMotion_b
vmap <s-right> <Plug>CamelCaseMotion_e
imap <s-left> <c-o><Plug>CamelCaseMotion_b
imap <s-right> <c-o><Plug>CamelCaseMotion_w
imap <c-b> <c-o>d<Plug>CamelCaseMotion_b
imap <c-d> <c-o>d<Plug>CamelCaseMotion_w
inoremap  <c-r>=AutoPairsDelete()<cr><c-w>
inoremap [3;5~ <c-o>dw

" Easy Motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERTYUIOPZXCVBNM;'
let g:EasyMotion_re_line_anywhere = '\v(<.|.>)|(\l)\zs(\u)|([-_=\+\*#\(\[]+\zs.)|([\.\{\}\)\]\^\$\|!/;:,"'."'".']+)'
let g:EasyMotion_re_anywhere = '\v(<.|^)|(<.|.$)|(_\zs.)|(#\zs.)'
map <space>; <Plug>(easymotion-next)
map <space>, <Plug>(easymotion-prev)
map <space>. <Plug>(easymotion-repeat)
map <space> <Plug>(easymotion-prefix)
map <space>/ <Plug>(easymotion-sn)
map <space>l <Plug>(easymotion-lineanywhere)
map <space>h <Plug>(easymotion-lineanywhere)
map <space>k <Plug>(easymotion-bd-jk)
" map F <Plug>(easymotion-lineanywhere)

nmap <space>v v<Plug>(easymotion-jumptoanywhere)
nmap <space>V V<Plug>(easymotion-bd-jk)
map <space>g <Plug>(easymotion-jumptoanywhere)
map <space><space> <Plug>(easymotion-s)

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-forward)
map z/ <Plug>(incsearch-fuzzyspell-/)
map z? <Plug>(incsearch-fuzzyspell-?)
map zg/ <Plug>(incsearch-fuzzyspell-stay)

" incsearch.vim x fuzzy x vim-easymotion
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" IndentLine
let g:indentLine_enabled = 1

" MultipleCursor
let g:multi_cursor_select_all_word_key = '<c-s-l>'
let g:multi_cursor_select_all_key = '<c-s-h>'

" Yoink
let g:yoinkSwapClampAtEnds = 0
let g:yoinkIncludeDeleteOperations = 1
let g:yoinkAutoFormatPaste = 1
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
nmap gy <plug>(YoinkPostPasteSwapBack)
nmap gY <plug>(YoinkPostPasteSwapForward)

" Subversive
let g:subversiveCurrentTextRegister = 'r'
map gr <plug>(SubversiveSubstitute)
nmap grr <plug>(SubversiveSubstituteLine)
nmap gR <plug>(SubversiveSubstituteToEndOfLine)
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)

" Key mapping
nnoremap K :grep! -F '<c-r><c-w>' .<cr>:cwindow<cr>
vnoremap K y:grep! -F '<c-r>0' .<cr>:cwindow<cr>

if executable('ag')
  set grepprg=ag\ --vimgrep\ --smart-case\ 2>/dev/null
elseif executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ 2>/dev/null
else
  nnoremap K :grep! -srF '<c-r><c-w>' .<cr>:cwindow<cr>
  vnoremap K y:grep! -srF '<c-r>0' .<cr>:cwindow<cr>
endif

let g:ag_prg="ag --vimgrep --smart-case --hidden"

if &diff
  nmap [ [c
  nmap ] ]c
  nmap <c-F5> :diffupdate<cr>
  set background=dark
  colorscheme solarized
endif

inoremap <s-cr> <c-o>o
" inoremap <s-a-cr> <esc>O
inoremap <c-a> <c-o>^
inoremap <c-f> <c-o>^
inoremap <c-e> <c-o>$
inoremap <c-k> <c-o>D
inoremap <s-tab> <c-o><<
inoremap <c-]> <c-o>>>
inoremap <c-l> <c-o>==
inoremap jj <esc>
noremap <F5> :redraw<cr>

cnoremap w!! w !sudo tee > /dev/null %
nnoremap <space>q :qa!<cr>
nnoremap <space>z :w !sudo tee % > /dev/null<cr>
nnoremap <space>zz :w !sudo tee % > /dev/null<cr>L:qa!<cr>

" nnoremap Y y$
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
nmap <tab> <c-w>w

vnoremap x "_x
vnoremap s "_s

nmap <leader>y "*y
nmap <leader>p "*p
nmap <leader>P "*P
nmap zy "*y
nmap Y "*y
nmap zp "0p
nmap zP "0P
vmap gy y`>
vmap gY "*y`>
map Q gq
map U <c-r>
map zgr "0gr

nnoremap gz `[v`]
vnoremap < <gv
vnoremap > >gv
vnoremap p pgvy
vnoremap v ^$h
vnoremap * y/\V<c-r>0<cr>
vnoremap # y?\V<c-r>0<cr>
nnoremap e 3<c-y>
nnoremap y 3<c-e>
inoremap e <c-o><c-y>
inoremap y i<c-o><c-e>

nnoremap <c-j> <esc>:bnext<cr>
nnoremap <c-k> <esc>:bprevious<cr>

nnoremap <leader>d <esc>:bdelete<cr>
nnoremap <space>d <esc>:bdelete<cr>

noremap <F8> :let @/ = ""<cr>
nnoremap <leader><cr> :nohlsearch<cr>
nnoremap <space><cr> :nohlsearch<cr>

nnoremap <Up> gk
nnoremap <Down> gj

nnoremap <leader>sw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o>

" YouCompleteMe
" noremap <F12> :YcmCompleter GoTo<cr>
" noremap <F9> :YcmCompleter GoToDeclaration<cr>
" noremap <F10> :YcmCompleter GoToDefinition<cr>
" noremap <F7> :YcmCompleter GoToReferences<cr>
" noremap gh :YcmCompleter GetDoc<cr>

if (has('gui_running'))
    set background=dark
    color solarized
    set guifont=YaHei\ consolas\ Hybrid:h10
    " set lines=36 columns=120
    set cursorcolumn
    set cursorline
    set go=
endif
