"
" author = himkt
" desc   = installing packages
"


call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}

Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

" rich search
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-anzu'

" language supports
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'

" colorscheme
Plug 'cocopon/iceberg.vim'

call plug#end()
