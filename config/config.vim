"
" ---------------------
"
" Vim configuration
"
" @author = 'himkt'
"
" ---------------------
"

if &compatible
  set nocompatible
endif

filetype    plugin indent on
syntax      on
colorscheme default

set background=dark

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" open with the cursor in previous session
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"" File encodings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ascii
set fileformats=unix,mac,dos

"" Open a new buffer without saving
set hidden

"" Show vim title for a window
set title

"" Show command in status line
set showcmd

"" Japanese input (TODO check whether if I can remove them)
set ttimeout
set ttimeoutlen=50

"" Enable cursor highlighting
set cursorline
set cursorcolumn
hi CursorLine   cterm=None ctermbg=238 ctermfg=None
hi CursorColumn cterm=None ctermbg=238 ctermfg=None

"" Indent and tab
set expandtab
set nowrap
set autoindent
set smartindent
set smarttab

"" shift and tab stop
set tabstop=2
set shiftwidth=2
autocmd FileType python setl tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType cpp    setl tabstop=4 shiftwidth=4 softtabstop=4

"" Do not create backup and swap files
set noswapfile
set nobackup

"" Enable incremental and hilighting search
set incsearch
set hlsearch

"" Hilight a matched bracket
set showmatch
set matchtime=1

"" Enable status line (it seems this does not have any effect)
"" because vim-airline overwrite this config
set laststatus=2

set backspace=indent,eol,start

"" Enable mouse
set mouse=a

"" If vertical split -> open a new pane to right,
"" and if horizontal split -> open a new pane to below
set splitbelow
set splitright

"" Folding config
set foldmethod=marker
set foldlevel=0

map ; :
nnoremap x "_x
vnoremap x "_x

" indent
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>

" tab shortcuts
nnoremap <silent> <C-n> : <C-u>tabnew<CR>
nnoremap <silent> <C-h> gT
nnoremap <silent> <C-l> gt

" window splitting
nnoremap <silent> vp : <C-u>vs<CR>
nnoremap <silent> sp : <C-u>sp<CR>

" folding configuration
nnoremap <silent>zx  : set foldlevel=99<CR>
nnoremap <silent>zc  : set foldlevel=0<CR>

" completion configuration
set completeopt=menuone,longest,preview
autocmd CompleteDone *  pclose
autocmd FileType *      setlocal omnifunc=syntaxcomplete#Complete


" tag hilighting
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|IMPORTANT\|CHANGED\|XXX\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(BUG\|HACK\|NOTE\|INFO\|IDEA\)')

" executing script in vim
autocmd FileType cpp    nnoremap <C-p> :exec ':term clang++ --std=c++11 % && ./a.out && rm a.out' <CR>
autocmd FileType rust   nnoremap <C-p> :exec ':term rustc % -o a && ./a && rm ./a' <CR>
autocmd FileType ruby   nnoremap <C-p> :exec ':term ruby %' <CR>
autocmd FileType python nnoremap <C-p> :exec ':term python %' <CR>
autocmd FileType python nnoremap <S-f> :call Autopep8() <CR>

" templates
autocmd BufNewFile *.cpp 0r $HOME/.dotfiles/template/cc/template.cc
autocmd BufNewFile *.cc  0r $HOME/.dotfiles/template/cc/template.cc
autocmd BufNewFile *.rs  0r $HOME/.dotfiles/template/rs/template.rs
