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
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
" Version control
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'idanarye/vim-merginal'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'

" Completion
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe'
"NeoBundle 'SirVer/ultisnips'
"NeoBundle 'honza/vim-snippets'
NeoBundle 'ervandew/supertab'

NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nvie/vim-togglemouse'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'chilicuil/vim-sml-coursera'
NeoBundle 'elmcast/elm-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'othree/html5.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'fatih/vim-go'
NeoBundle 'pearofducks/ansible-vim'

" Haskell plugins
NeoBundle 'neovimhaskell/haskell-vim'
NeoBundle 'enomsg/vim-haskellConcealPlus'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle "alx741/vim-hindent"

NeoBundle 'Twinside/vim-hoogle'
NeoBundle 'mpickering/hlint-refactor-vim'

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
set foldlevelstart=1
" Elm
augroup Elm
    autocmd!
    autocmd FileType elm setlocal shiftwidth=2 softtabstop=2 tabstop=2
    autocmd BufWrite *.elm setlocal filetype=elm
augroup END
" Automatically kill trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
set ignorecase
set smartcase
set incsearch

" elm
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1
let g:elm_setup_keybindings = 1

autocmd Filetype elm setlocal ts=4 sts=4 sw=4

" haskell
autocmd FileType haskell let &formatprg="stylish-haskell"

" tagbar
nmap <F8> :TagbarToggle<CR>

" Aesthetics
let g:indentLine_noConcealCursor=""

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
    colorscheme solarized
endif

" Colorcolumn
set fo-=t
set colorcolumn=101
highlight ColorColumn ctermbg=10

" Airline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set laststatus=2
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

nnoremap <SPACE> <Nop>
let mapleader = " "

" disable bg erase for tmux
set t_ut=

" syntastic
let g:synatastic_python_checkers = ['python', 'pep8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1
nnoremap <F3> :SyntasticCheck<CR>

" tabs
nnoremap <Leader>th  :tabfirst<CR>
nnoremap <Leader>tj  :tabnext<CR>
nnoremap <Leader>tk  :tabprev<CR>
nnoremap <Leader>tl  :tablast<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>td  :tabclose<CR>
nnoremap <Leader>tc  :tabnew<CR>

" NERDToggle
nnoremap <F4> :NERDTreeToggle<CR>

let g:ctrlp_extensions = ['funky']
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v web\/htdocs'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }

nmap s <Plug>(easymotion-s)
omap t <Plug>(easymotion-bd-tl)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" Git commits
au FileType gitcommit set tw=100

" completion
let g:ycm_semantic_triggers = {
            \ 'elm' : ['.'],
            \}
" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
"let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



set wildmode=longest,list,full
set wildmenu

" neovim
if !has('nvim')
    set encoding=utf8
endif
