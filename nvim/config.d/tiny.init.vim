" vim: ft=vim
"
" author = himkt
" desc   = installing packages
"


call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'godlygeek/tabular'

" rich search
Plug 'osyo-manga/vim-anzu'

" language supports
Plug 'google/vim-jsonnet'
Plug 'tpope/vim-rails'

call plug#end()
