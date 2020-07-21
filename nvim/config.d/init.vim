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
call plug#begin('~/.config/nvim/plugged')
  Plug 'godlygeek/tabular'
  Plug 'google/vim-jsonnet'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'osyo-manga/vim-anzu'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-rails'
  Plug 'vim-airline/vim-airline'
call plug#end()

" coc.nvim
imap <C-j> <Plug>(coc-snippets-expand)

" fzf, fzf.vim
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --color --line-number '.shellescape(<q-args>),
      \   <bang>0,
      \   fzf#vim#with_preview('right'),
      \   <bang>0)

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'), <bang>0)
nnoremap <silent> <C-p> : call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" nardtree
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

" tabular
vnoremap tr : <C-u>Tabularize<Space>/

" vim-anzu
set statusline=%anzu#search_status()
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)

" vim-nerdtree-tabs
nnoremap <silent><C-e> : NERDTreeTabsToggle<CR>
map      <C-l>         :tabn<CR>
map      <C-h>         :tabp<CR>

" vim-jsonnet
let g:jsonnet_fmt_on_save = 0
