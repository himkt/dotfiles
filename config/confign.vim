"
" author = 'himkt'
" desc   = 'My neovim configuration'
"


" ------------- "
" vim-plug conf "
" ------------- "

call plug#begin('~/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'osyo-manga/vim-anzu'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'haya14busa/incsearch.vim'
Plug 't9md/vim-quickhl'
Plug 'osyo-manga/vim-over'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-ruby/vim-ruby'
Plug 'rust-lang/rust.vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'
call plug#end()


" Plug 'ryanoasis/vim-devicons'
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''

" Plug 'Shougo/denite.nvim'
call denite#custom#source('file_rec', 'sorters', ['sorter/word', 'sorter/reverse'])
call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')
nnoremap <silent> fu :<C-U>Denite file_rec -highlight-mode-insert=Search<CR>
nnoremap <silent> fg :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> ff :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = $HOME . '/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $HOME . '/work'
call deoplete#custom#source('_',  'max_menu_width', 0)

" Plug 'autozimu/LanguageClient-neovim'
set hidden
set completefunc=LanguageClient#complete
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls']}
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Plug 'Shougo/neosnippet'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.dotfiles/snippet'

" Plug 'scrooloose/nerdtree'
nnoremap <silent><C-e> : NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Plug 'junegunn/seoul256.vim'
colorscheme seoul256

" Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" Plug 'godlygeek/tabular'
vnoremap tr : <C-u>Tabularize<Space>/

" Plug 'majutsushi/tagbar'
nnoremap <silent><C-t> : TagbarToggle<CR>

" Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
set statusline=%anzu#search_status()

" Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" Plug 'scrooloose/syntastic'
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -I' . $BREW_HOME . '/include'
let g:syntastic_cpp_check_header = 1
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_rust_checkers = ['rustc', 'cargo']

" Plug 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)

" Plug 't9md/vim-quickhl'
map <C-i> <Plug>(quickhl-manual-this)
map <C-m> <Plug>(quickhl-manual-reset)

" Plug 'osyo-manga/vim-over'
nnoremap <silent><C-x> : OverCommandLine<CR>%s/

" Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']

" Plug 'lervag/vimtex'
autocmd FileType tex    setlocal omnifunc=vimtex#complete#omnifunc
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Plug 'tell-k/vim-autopep8'
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



" ----------- "
" base config "
" ----------- "

" If you have an error, `cd $HOME/.dotfiles && make requirements` may solve it.
let g:python3_host_prog = $PYENV_ROOT . '/versions/3.6.3/bin/python'

if &compatible
  set nocompatible
endif

filetype plugin indent on
syntax on

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

" file encoding
set encoding=utf-8
set fileencodings=utf-8,iso-2user_jp,euc-jp,ascii

" for japanese input
set ttimeout
set ttimeoutlen=50

set fileformats=unix,mac,dos
set wrap visualbell ruler
set showcmd
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

" tabstop configuraton
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
