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
source $HOME/.dotfiles/nvim/config.d/vimrc

" load packages
source $HOME/.dotfiles/nvim/config.d/tiny.init.vim

" use custom colorscheme
syntax      reset
colorscheme darkblue

set fillchars+=vert:│
hi  VertSplit ctermbg=None ctermfg=Blue

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
      \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'), <bang>0)

" Plug 'scrooloose/nerdtree'
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine gui=underline
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END

let g:NERDTreeMouseMode=3  " open file with one click
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let g:NERDTreeWinSize = 40

" Plug 'jistr/vim-nerdtree-tabs'
nnoremap <silent><C-e> : NERDTreeTabsToggle<CR>
map      <C-l>         :tabn<CR>
map      <C-h>         :tabp<CR>

" Plug 'godlygeek/tabular'
vnoremap tr : <C-u>Tabularize<Space>/

" Plug 'majutsushi/tagbar'
nnoremap <silent><C-t> : TagbarToggle<CR>

" Plug 'osyo-manga/vim-anzu'
set statusline=%anzu#search_status()
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)

" Plug 'vim-airline/vim-airline'
let g:airline_theme = 'ayu_dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

" Plug 'google/vim-jsonnet'
let g:jsonnet_fmt_on_save = 0
