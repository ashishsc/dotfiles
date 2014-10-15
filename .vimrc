"NeoBundle Scripts-----------------------------
if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
" NeoBundle 'Shutnik/jshint2.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'honza/vim-snippets'
NeoBundle 'nvie/vim-togglemouse'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'chilicuil/vim-sml-coursera'
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
filetype indent on
set number
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
autocmd BufWritePre * :%s/\s\+$//e

" tagbar
nmap <F8> :TagbarToggle<CR>

" Aesthetics
syntax enable
if has('gui_running')
    set background=dark
    colorscheme solarized
    set guifont=Source\ Code\ Pro\ for\ Powerline

    " Remove those silly silly bars
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
else
    set background=dark
    colorscheme Monokai
endif

" Airline
set laststatus=2

let mapleader = ","

" disable bg erase for tmux
set t_ut=

" syntastic
let g:synatastic_python_checkers = ['python', 'pep8']
nnoremap <F3> :SyntasticCheck<CR>

" tabs
nnoremap <Leader>th  :tabfirst<CR>
nnoremap <Leader>tj  :tabnext<CR>
nnoremap <Leader>tk  :tabprev<CR>
nnoremap <Leader>tl  :tablast<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>tn  :tabnext<Space>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>td  :tabclose<CR>
nnoremap <Leader>tc  :tabnew<CR>

let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v web\/htdocs'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }
