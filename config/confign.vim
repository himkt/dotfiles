"
" @author = himkt
"


" ----------- "
" dein config "
" ----------- "
call plug#begin('~/.config/nvim/plugged')

" ---- devicons ----
Plug 'ryanoasis/vim-devicons'

" ---- dark powered ----
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" ---- auto completion ----
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ---- snippet ----
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" ---- filer ----
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'

" ---- colorscheme ----
Plug 'junegunn/seoul256.vim'

" ---- status bar ----
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---- efective editing ----
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'osyo-manga/vim-anzu'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'

" ---- syntax checker ----
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'

" ---- rich visualization ----
Plug 'haya14busa/incsearch.vim'
Plug 't9md/vim-quickhl'

" ---- rich replacing feature ----
Plug 'osyo-manga/vim-over'

" ---- languages ----
Plug 'sheerun/vim-polyglot'

" ---- latex ----
Plug 'lervag/vimtex'

" ---- c++ ----
Plug 'zchee/deoplete-clang'
Plug 'octol/vim-cpp-enhanced-highlight'

" ---- ruby ----
Plug 'Shougo/deoplete-rct'
Plug 'vim-ruby/vim-ruby'

" ---- python ----
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'

call plug#end()

" ----------- "
" base config "
" ----------- "

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

" enable syntax support
filetype plugin indent on

" enable hilighting
syntax on

" Unified color scheme (default: dark)
colo seoul256

" omni completion
set completeopt=menuone,longest,preview

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

" for japanese input
set ttimeout
set ttimeoutlen=50

set fileformats=unix,mac,dos
set wrap visualbell ruler
set nocompatible showcmd
set autoindent smartindent expandtab
set numberwidth=5 shiftwidth=2 tabstop=2
set nowritebackup nobackup noswapfile
set incsearch hlsearch
set showmatch matchtime=1
set laststatus=2
set backspace=indent,eol,start
set mouse=a
set splitbelow splitright
set foldmethod=marker foldlevel=0
set statusline=%{anzu#search_status()}
set list listchars=trail:-,extends:»,precedes:«,nbsp:%,tab:\ \ 

map / <Plug>(incsearch-forward)
map ; :
nnoremap x "_x
vnoremap x "_x

" indent
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>

" snippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" rich hilighting
map <C-i> <Plug>(quickhl-manual-this)
map <C-m> <Plug>(quickhl-manual-reset)

" tab shortcuts
nnoremap <silent> <C-n> : <C-u>tabnew<CR>
nnoremap <silent> <C-h> gT
nnoremap <silent> <C-l> gt

" window splitting
nnoremap <silent> vp : <C-u>vs<CR>
nnoremap <silent> sp : <C-u>sp<CR>

" folding
nnoremap <silent>zx  : set foldlevel=99<CR>
nnoremap <silent>zc  : set foldlevel=0<CR>

" plugin shortcuts
nnoremap <silent><C-e> : NERDTreeTabsToggle<CR>
nnoremap <silent><C-t> : TagbarToggle<CR>
nnoremap <silent><C-x> : OverCommandLine<CR>%s/
vnoremap tr            : <C-u>Tabularize<Space>/

" completion
autocmd CompleteDone *  pclose
autocmd FileType *      setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType tex    setlocal omnifunc=vimtex#complete#omnifunc
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType ruby   setlocal omnifunc=rubycomplete#Complete

" anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" python tab config
autocmd FileType python setl autoindent tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType cpp setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4

" tag hilighting
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|IMPORTANT\|CHANGED\|XXX\)')
autocmd Syntax * call matchadd('Todo',  '\W\zs\(BUG\|HACK\|NOTE\|INFO\|IDEA\)')

" executing script in vim
autocmd FileType cpp    nnoremap <C-p> :exec ':term g++ --std=c++11 % && ./a.out && rm a.out' <CR>
autocmd FileType rust   nnoremap <C-p> :exec ':term rustc % -o a && ./a && rm ./a' <CR>
autocmd FileType ruby   nnoremap <C-p> :exec ':term ruby %' <CR>
autocmd FileType python nnoremap <C-p> :exec ':term python %' <CR>
autocmd FileType python nnoremap <S-f> :call Autopep8() <CR>

" templates
autocmd BufNewFile *.cpp 0r $HOME/.dotfiles/template/cc/template.cc
autocmd BufNewFile *.cc  0r $HOME/.dotfiles/template/cc/template.cc
autocmd BufNewFile *.rs  0r $HOME/.dotfiles/template/rs/template.rs

" indent guide feature
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" python config
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" syntastic
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -I' . $BREW_HOME . '/include'
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" nerdtree
let g:NERDTreeShowHidden=1

" neosnippet
let g:neosnippet#snippets_directory='~/.dotfiles/snippet'

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_',  'max_menu_width', 0)

" vim-airline
let g:airline_theme='bubblegum'

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" denite
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')
nnoremap <silent> fu :<C-U>Denite file_rec -highlight-mode-insert=Search<CR>
nnoremap <silent> fg :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> ff :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>

" vim-polygplot
let g:polyglot_disabled = ['latex']

" vim-tex
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})


function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

let OSTYPE = system('uname')
if OSTYPE == "Darwin\n"
  let g:deoplete#sources#clang#libclang_path = $BREW_HOME . '/Cellar/llvm/7.0.1/lib/libclang.dylib'
elseif OSTYPE == "Linux\n"
  let g:deoplete#sources#clang#libclang_path = $BREW_HOME . '/Cellar/llvm/7.0.1/lib/libclang.so'
endif
