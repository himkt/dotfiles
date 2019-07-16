" vim: ft=vim
"
" author = himkt
" desc   = installing packages
"


call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'

" rich search
Plug 'haya14busa/incsearch.vim'
Plug 'osyo-manga/vim-anzu'

" language supports
Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'google/vim-jsonnet'

" colorscheme
Plug 'cocopon/iceberg.vim'
Plug 'nielsmadan/harlequin'

" utility
Plug 'himkt/docstring.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
