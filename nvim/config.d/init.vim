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
  Plug 'sheerun/vim-polyglot'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'himkt/cargo-atcoder.nvim'
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
nmap <Leader>s <Plug>(easymotion-sn)
 
" fzf
nnoremap <silent> <C-p> :call fzf#vim#files('', fzf#vim#with_preview('right')) <CR>
nnoremap <silent> <C-x> :Commands <CR>

" tabular
vnoremap tr :<C-u> Tabularize /

" vim-indent-guide
let g:indent_guides_enable_on_vim_startup = 1

" coc.nvim
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer']
nmap <silent> cd :call CocAction('jumpDefinition', 'tabe')   <CR>
nmap <silent> cv :call CocAction('jumpDefinition', 'vsplit') <CR>
nmap <silent> ch :call CocAction('doHover') <CR>
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> fm <Plug>(coc-format)
