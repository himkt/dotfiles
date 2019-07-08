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
colorscheme iceberg

" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number '.shellescape(<q-args>), 0,
      \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
nnoremap <silent> <C-p> : call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call deoplete#custom#source('_',  'max_menu_width', 0)
let g:deoplete#enable_at_startup = 1

" Plug 'autozimu/LanguageClient-neovim'
set completefunc=LanguageClient#complete
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_serverCommands = {
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
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
nnoremap <silent><C-e> : NERDTreeToggle<CR>

" Plug 'godlygeek/tabular'
vnoremap tr : <C-u>Tabularize<Space>/

" Plug 'majutsushi/tagbar'
nnoremap <silent><C-t> : TagbarToggle<CR>

" Plug 'osyo-manga/vim-anzu'
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
set statusline=%anzu#search_status()

" Plug 'w0rp/ale'
let g:ale_sign_error = '*'
let g:ale_sign_warning = '!'
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_linters = {
    \ 'python': ['pylint', 'flake8', 'pep8'],
    \ 'cpp': ['clang++']}


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
