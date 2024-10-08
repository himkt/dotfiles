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

"" disable mouse
set mouse=

"" use python3 installed globally
let g:python3_host_prog=$PYTHONSYSTEMPATH

"" load basic vim configuration
source $HOME/dotfiles/nvim/config.d/vimrc

"" load packages
call plug#begin('~/.config/nvim/plugged')
  Plug 'easymotion/vim-easymotion'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'osyo-manga/vim-anzu'
  Plug 'vim-airline/vim-airline'
  Plug 'sheerun/vim-polyglot'
call plug#end()

" material.vim
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE
hi Visual guibg=gray

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap // <Plug>(easymotion-sn)

" fzf
nnoremap <silent> <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right')) <CR>
nnoremap <silent> <C-x> :Commands <CR>

" tabular
vnoremap tr :<C-u> Tabularize /

" vim-indent-guide
let g:indent_guides_enable_on_vim_startup = 1
