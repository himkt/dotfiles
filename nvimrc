"
" @author = himkt
"


" ----------- "
" dein config "
" ----------- "
call plug#begin('~/.config/nvim/plugged')

" ---- devicons ----
Plug 'ryanoasis/vim-devicons'

" ---- colorscheme ----
Plug 'joshdick/onedark.vim'

" ---- dark powered ----
Plug 'Shougo/denite.nvim'

" ---- auto completion ----
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ---- snippet ----
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" ---- filer ----
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ---- git interface ----
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ---- status bar ----
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---- efective editing ----
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'

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

" ---- latex ----
Plug 'lervag/vimtex'

" ---- c++ ----
Plug 'octol/vim-cpp-enhanced-highlight'

" ---- ruby ----
Plug 'vim-ruby/vim-ruby'

" ---- python ----
Plug 'hynek/vim-python-pep8-indent'
Plug 'zchee/deoplete-jedi'
Plug 'tell-k/vim-autopep8'

call plug#end()

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
colorscheme onedark

" omni completion
set completeopt=menuone,longest,preview

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

set fileformats=unix,mac,dos
set number wrap visualbell
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

" snippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" rich hilighting
map <C-i> <Plug>(quickhl-manual-this)
map <C-m> <Plug>(quickhl-manual-reset)

" tab shortcuts
nnoremap <silent> <C-n> : <C-u>tabnew<CR>
nnoremap <silent> <C-j> gt
nnoremap <silent> <C-k> gT

" window splitting
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
nnoremap <silent> vp : <C-u>vs<CR>
nnoremap <silent> sp : <C-u>sp<CR>

" folding
nnoremap <silent>zx  : set foldlevel=99<CR>
nnoremap <silent>zc  : set foldlevel=0<CR>

" plugin shortcuts
nnoremap <silent><C-e> : NERDTreeToggle<CR>
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

" python tab config
autocmd FileType python setl autoindent tabstop=8 expandtab shiftwidth=4 softtabstop=4

" tag hilighting
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|IMPORTANT\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')

" executing script in vim
autocmd FileType ruby nnoremap <C-p> :!ruby %:t<CR>
autocmd FileType cpp nnoremap <C-p> :exec ':term g++ --std=c++11 -I/opt/brew/include' shellescape(@%, 1) ' -o ' shellescape(@%, 1) . '.out' ' && ./' . shellescape(@%, 1) . '.out'<CR>
autocmd FileType python nnoremap <C-p> :exec ':term python' shellescape(@%, 1)<CR>

" indent guide feature
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234


" -------------- "
"  python config "
" -------------- "

let g:python3_host_prog = $PYENV_ROOT . '/shims/python'

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
let g:syntastic_cpp_compiler_options = '-std=c++11'

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

" deoplete
let g:deoplete#enable_at_startup = 1

"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''


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

autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
