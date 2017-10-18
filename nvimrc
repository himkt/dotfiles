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
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" ---- colorscheme ----
Plug 'jonathanfilip/vim-lucius'
Plug 'KeitaNakamura/neodark.vim'
Plug 'tyrannicaltoucan/vim-quantum'

" ---- git interface ----
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ---- status bar ----
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---- efective editing ----
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'osyo-manga/vim-anzu'
Plug 'tomtom/tcomment_vim'
Plug 'cohama/lexima.vim'
Plug 'bronson/vim-trailing-whitespace'

" ---- syntax checker ----
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'

" ---- markdown previewer ----
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

" ---- rich visualization ----
Plug 'haya14busa/incsearch.vim'
Plug 't9md/vim-quickhl'

" ---- rich replacing feature ----
Plug 'osyo-manga/vim-over'

" ---- markdown ----
Plug 'rcmdnk/vim-markdown'
Plug 'joker1007/vim-markdown-quote-syntax'

" ---- languages ----
Plug 'sheerun/vim-polyglot'

" ---- latex ----
Plug 'lervag/vimtex'

" ---- c++ ----
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tweekmonster/deoplete-clang2'

" ---- ruby ----
Plug 'vim-ruby/vim-ruby'

" ---- python ----
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

" set leader key
let mapleader = ","
let g:mapleader = ","

" enable syntax support
filetype plugin indent on

" enable hilighting
syntax on

" color scheme
colorscheme neodark

" omni completion
set completeopt=menuone,longest,preview

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

" for japanese input
set ttimeout
set ttimeoutlen=50

set background=dark
set fileformats=unix,mac,dos
set number wrap visualbell ruler
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
set statusline=%{anzu#search_status()}
set list listchars=trail:-,extends:»,precedes:«,nbsp:%,tab:\ \ 

colorscheme lucius

" basic shortcuts

nnoremap <leader>d "_d
vnoremap <leader>d "_d
nnoremap x "_x
vnoremap x "_x

map ; :
map /  <Plug>(incsearch-forward)

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

" make mapping
nnoremap :make :!make

" window splitting
" nnoremap <silent>> <C-w>>
" nnoremap <silent>< <C-w><
nnoremap <silent> vp : <C-u>vs<CR>
nnoremap <silent> sp : <C-u>sp<CR>

" folding
nnoremap <silent>zx  : set foldlevel=99<CR>
nnoremap <silent>zc  : set foldlevel=0<CR>

" plugin shortcuts
nnoremap <silent><C-e> : NERDTreeTabsToggle<CR>
nnoremap <silent><C-t> : TagbarToggle<CR>
nnoremap <silent>fu    : Denite file_rec<CR>
nnoremap <silent><C-x> : OverCommandLine<CR>%s/
vnoremap tr            : <C-u>Tabularize<Space>/

" deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" completion
autocmd CompleteDone *  pclose
autocmd FileType *      setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python setlocal omnifunc=python3complete#Complete
autocmd FileType ruby   setlocal omnifunc=rubycomplete#Complete

" anzu
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)

" python tab config
autocmd FileType python setl autoindent tabstop=8 expandtab shiftwidth=4 softtabstop=4

" tag hilighting
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|IMPORTANT\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

" executing script in vim
let g:file_name = shellescape(@%, 1)
autocmd FileType ruby nnoremap <C-p> :exec 'term ruby' %:t<CR>
autocmd FileType cpp nnoremap <C-p> :exec ':term g++ --std=c++11 -I' $BREW_HOME . '/include % && ./a.out && rm a.out' <CR>
autocmd FileType python nnoremap <C-p> :exec ':term python %'<CR>
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>


" templates
autocmd BufNewFile *.cpp 0r $HOME/.dotfiles/template/cc/template.cc
autocmd BufNewFile *.cc 0r $HOME/.dotfiles/template/cc/template.cc

" indent guide feature
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" -------------- "
"  python config "
" -------------- "

let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'

" ------------- "
" plugin config "
" ------------- "

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -I' . $BREW_HOME . '/include'
let g:syntastic_cpp_check_header = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline_right_sep = '⮂'
let g:airline_left_sep = '⮀'
let g:airline_branch_prefix = '⭠'
let g:airline_linecolumn_prefix = '⭡'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#left_alt_sep = '⮀'

" nerdtree
let g:NERDTreeShowHidden=1

" neosnippet
let g:neosnippet#snippets_directory='~/.dotfiles/snippet'

" deoplete
let g:deoplete#enable_at_startup = 1

"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" denite
call denite#custom#map('insert', "<C-n>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-p>", '<denite:move_to_previous_line>')

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
  let g:deoplete#sources#clang#libclang_path = $BREW_HOME . '/Cellar/llvm/4.0.0/lib/libclang.dylib'
elseif OSTYPE == "Linux\n"
  let g:deoplete#sources#clang#libclang_path = $BREW_HOME . '/Cellar/llvm/4.0.0/lib/libclang.so'
endif
