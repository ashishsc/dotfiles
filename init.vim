"NeoVim init.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/ashish/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/ashish/.vim'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Plugins

" Version control
call dein#add('tpope/vim-fugitive')

" Movement/Macros
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')
call dein#add('scrooloose/nerdcommenter')
call dein#add('christoomey/vim-tmux-navigator')

" Completion
call dein#add('Raimondi/delimitMate')
" TODO disabled until I can figure it out
" call dein#add('Valloric/YouCompleteMe')
call dein#add('Shougo/deoplete.nvim')

" Linting
call dein#add('scrooloose/syntastic')

" File Navigation
call dein#add('kien/ctrlp.vim')
call dein#add('scrooloose/nerdtree')


" Aesthetics
call dein#add('flazz/vim-colorschemes')
call dein#add('Yggdroot/indentLine')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('blueyed/vim-diminactive')

" JavaScript
" TODO: cant use tern_for_vim deoplete until
call dein#add('marijnh/tern_for_vim')
call dein#add('carlitux/deoplete-ternjs')

" Elm
call dein#add('elmcast/elm-vim')

" Haskell
call dein#add('neovimhaskell/haskell-vim')
call dein#add('enomsg/vim-haskellConcealPlus')
call dein#add('eagletmt/neco-ghc')
call dein#add('Twinside/vim-hoogle')
call dein#add('mpickering/hlint-refactor-vim')

" Other
call dein#add('tpope/vim-sleuth')
call dein#add('sickill/vim-pasta')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



"------------ Aesthetics -----------
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

let g:indentLine_noConcealCursor=""

" Colorcolumn
set fo-=t
set colorcolumn=101
highlight ColorColumn ctermbg=0

set number

" Indentation
set tabstop=4
set shiftwidth=4
set expandtab

" folding
set foldmethod=indent
set foldlevelstart=1

" search
set hlsearch
set smartcase
set ignorecase
set incsearch





" --------- Keys -------------
nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <F3> :SyntasticCheck<CR>
nnoremap <F4> :NERDTreeToggle<CR>

" Automatically kill trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" tabs
nnoremap <Leader>th  :tabfirst<CR>
nnoremap <Leader>tj  :tabnext<CR>
nnoremap <Leader>tk  :tabprev<CR>
nnoremap <Leader>tl  :tablast<CR>
nnoremap <Leader>tt  :tabedit<Space>
nnoremap <Leader>tm  :tabm<Space>
nnoremap <Leader>td  :tabclose<CR>
nnoremap <Leader>tc  :tabnew<CR>




" ------- Plugin config ----
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v web\/htdocs'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }


" elm
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1
let g:elm_setup_keybindings = 1

" haskell
autocmd FileType haskell let &formatprg="stylish-haskell"

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" YouCompleteMe
" TODO: Disabled until I can get it to work
"let g:ycm_semantic_triggers = {
"      \ 'elm' : ['.'],
"      \}
" Deoplete
" Use deoplete until we can get YCM working
" autocomplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}

" tab for cycling through options
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" enter closes options if present and inserts linebreak
" apparently this has to be that complicated
inoremap <silent> <CR> <C-r>=<SID>close_and_linebreak()<CR>
function! s:close_and_linebreak()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction

" -------- Other ---------
set wildmode=longest,list,full
set wildmenu

" neovim
if !has('nvim')
    set encoding=utf8
endif
