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
Plugin 'ryanoasis/vim-devicons'
Plugin 'neoclide/coc.nvim'
Plugin 'sjl/badwolf'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'





" All of your Plugins must be added before the following line
call vundle#end()            " required

" }}}


" Color {{{
colorscheme badwolf         " awesome colorscheme
" }}}

" Basics {{{
set nocompatible              " be iMproved, required
syntax enable           " enable syntax processing
set encoding=UTF-8
set guifont=Hack-Regular


au BufNewFile, BufWrite, BufRead *.py
\   set tabstop=4
\ | set softtabstop=4
\ | set shiftwidth=4
\ | set textwidth=79
\ | set expandtab
\ | set autoindent
\ | set fileformat=unix



set relativenumber              " show line numbers
set showcmd             " show command in bottom bar
set clipboard=unnamed
set cursorline          " highlight current line
set mouse=a
" set paste
filetype indent on      " load filetype-specific indent files
filetype plugin on
set fillchars+=vert:┃


set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]


set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-S-s> :wq<CR>
nnoremap <C-S-A> :qa<CR>

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

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


" save session
nnoremap <leader>s :mksession<CR>


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
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1


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


" Jedi-Vim {{{

let g:jedi#force_py_version = 3
let g:jedi#auto_initialization = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#popup_on_dot = 1
let g:jedi#completions_command = "<C-Space>"


" }}}

" vim:foldmethod=marker:foldlevel=0
