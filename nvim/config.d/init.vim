" vim: ft=vim
"
" ---------------------
"
" NeoVim configuration
"
" @author = 'himkt'
"
" ---------------------
"

"" use python3 installed globally
let g:python3_host_prog=$SYSTEM_PYTHON_PATH

"" load basic vim configuration
source $HOME/.dotfiles/vim/config.d/vimrc

" load packages
source $HOME/.dotfiles/nvim/config.d/tiny.init.vim

" use custom colorscheme
syntax      reset
colorscheme codedark

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --color --line-number '.shellescape(<q-args>),
      \   <bang>0,
      \   fzf#vim#with_preview('right'),
      \   <bang>0)
nnoremap <silent> <C-p> : call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>



command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   fzf#vim#with_preview('right'),
      \   <bang>0)

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_',  'max_menu_width', 0)

" Plug 'autozimu/LanguageClient-neovim'
set completefunc=LanguageClient#complete
let g:LanguageClient_useVirtualText = 0
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'go': ['gopls'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'python': ['pyls']}
nnoremap <silent> H  :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K  :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>


" Plug 'Shougo/neosnippet'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/.dotfiles/snippets'

" Plug 'scrooloose/nerdtree'
let g:NERDTreeMouseMode=3
nnoremap <silent><C-e> : NERDTreeToggle<CR>
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine gui=underline
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END

" Plug 'godlygeek/tabular'
vnoremap tr : <C-u>Tabularize<Space>/

" Plug 'majutsushi/tagbar'
nnoremap <silent><C-t> : TagbarToggle<CR>

" Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
set statusline=%anzu#search_status()

" Plug 'w0rp/ale'
let g:ale_fixers = {
      \ 'go': ['gofmt', 'goimports'],
      \ 'python': ['black', 'isort'],
      \ 'ruby': ['rubocop']}

" Plug 'vim-airline/vim-airline'
let g:airline_theme= 'deus'

" Plug 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)

" Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex']

" Plug 'lervag/vimtex'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 1
let g:vimtex_quickfix_open_on_warning = 0
autocmd FileType tex setlocal omnifunc=vimtex#complete#omnifunc
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})
