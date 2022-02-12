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
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'sheerun/vim-polyglot'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" material.vim
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

colorscheme material
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
hi Normal guibg=NONE ctermbg=NONE

" vim-easymotion
let g:EasyMotion_do_mapping = 0
nmap <Leader>s <Plug>(easymotion-sn)
 
" fzf
nnoremap <silent> <C-p> : call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>

" tabular
vnoremap tr : <C-u>Tabularize<Space>/

" vim-indent-guide
let g:indent_guides_enable_on_vim_startup = 1

" coc.nvim
let g:coc_global_extensions = ['coc-pyright']
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)
