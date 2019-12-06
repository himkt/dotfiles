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
colorscheme onehalfdark

set fillchars+=vert:│
hi  VertSplit ctermbg=None ctermfg=Yellow

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

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
command! CocInit CocInstall
      \ coc-go coc-python coc-solargraph
      \ coc-snippets coc-json coc-tsserver coc-eslint

nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)
nmap <silent> cn <Plug>(coc-rename)
nmap <silent> cf <Plug>(coc-fix-current)
nmap <silent> K :call <SID>show_documentation()<CR>
imap <C-k> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Plug 'scrooloose/nerdtree'
let g:NERDTreeMouseMode=3
nnoremap <silent><C-e> : NERDTreeTabsToggle<CR>
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

" Plug 'vim-airline/vim-airline'
let g:airline_theme= 'deus'
