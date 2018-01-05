"
" @author = himkt
"


" ----------- "
" base config "
" ----------- "

" set leader key
let mapleader = ","

" enable syntax support
filetype plugin indent on

" enable hilighting
syntax on

" color scheme
colorscheme desert

" omni completion
set completeopt=menuone,longest,preview

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

set fileformats=unix,mac,dos
set wrap visualbell
set nocompatible showcmd
set autoindent smartindent expandtab
set numberwidth=5 shiftwidth=2 tabstop=2
set nowritebackup nobackup noswapfile
set incsearch hlsearch
set showmatch matchtime=1
set laststatus=2
set backspace=indent,eol,start
set clipboard+=unnamed mouse=a
set splitbelow splitright
set foldmethod=marker foldlevel=99
set list listchars=trail:-,extends:»,precedes:«,nbsp:%,tab:\ \ 

" basic shortcuts
map ; :
map /  <Plug>(incsearch-forward)

" rich hilighting
map <C-i> <Plug>(quickhl-manual-this)
map <C-m> <Plug>(quickhl-manual-reset)
 

" tab shortcuts
nnoremap <silent> <C-j> : <C-u>tabnew<CR>
nnoremap <silent> <C-l> gt
nnoremap <silent> <C-h> gT

" window splitting
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
nnoremap <silent> vp : <C-u>vs<CR>
nnoremap <silent> sp : <C-u>sp<CR>

" paste mode
nnoremap <silent> np : <C-u>set paste<CR>
nnoremap <silent> nn : <C-u>set nopaste<CR>

" folding
nnoremap <silent>zx  : set foldlevel=99<CR>
nnoremap <silent>zc  : set foldlevel=0<CR>

" completion
autocmd CompleteDone *  pclose
autocmd FileType *      setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType ruby   setlocal omnifunc=rubycomplete#Complete

" python tab config
autocmd FileType python setl autoindent tabstop=8 expandtab shiftwidth=4 softtabstop=4

" tag hilighting
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|IMPORTANT\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

" executing script in vim
autocmd FileType ruby nnoremap <C-p> :!ruby %:t<CR>
autocmd FileType cpp nnoremap <C-p> :exec '!g++ --std=c++11 -I/opt/brew/include' shellescape(@%, 1) ' -o ' shellescape(@%, 1) . '.out' ' && ./' . shellescape(@%, 1) . '.out'<CR>
autocmd FileType python nnoremap <C-p> :exec '!python' shellescape(@%, 1)<CR>

" indent guide feature
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
