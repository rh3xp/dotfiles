" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'neoclide/coc.nvim'
Plugin 'sjl/badwolf'
Plugin 'rking/ag.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'




" All of your Plugins must be added before the following line
call vundle#end()            " required

" }}}


" Spaces & Tabs {{{
colorscheme badwolf         " awesome colorscheme
" }}}

" Basics {{{
set nocompatible              " be iMproved, required
syntax enable           " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set relativenumber              " show line numbers
set showcmd             " show command in bottom bar
set clipboard=unnamed
set cursorline          " highlight current line
set mouse=a
set paste
filetype indent on      " load filetype-specific indent files
filetype plugin on
set fillchars+=vert:┃


set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]


set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" }}}

" Folding {{{

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" }}}

" Movement {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]


let mapleader=","       " leader is comma


" jk is escape
inoremap jk <esc>

" }}}

" Other {{{

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>


" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" save session
nnoremap <leader>s :mksession<CR>


" open ag.vim
nnoremap <leader>a :Ag


augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


augroup auto_comment
    au!
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" }}}


" Backups {{{

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" }}}


" Syntastic {{{

nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'

" }}}


" CtrlP settings {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}


" NERDTree {{{
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" }}}


" Easymotion {{{
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" }}}


" Airline {{{
set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

" }}}

" vim:foldmethod=marker:foldlevel=0
