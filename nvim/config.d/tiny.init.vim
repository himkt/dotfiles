" vim: ft=vim
"
" author = himkt
" desc   = installing packages
"


call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'

" rich search
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-anzu'

" language supports
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'google/vim-jsonnet'

" colorscheme
Plug 'vim-scripts/ScrollColors'
Plug 'tomasiser/vim-code-dark'
Plug 'ntk148v/vim-horizon'

call plug#end()
