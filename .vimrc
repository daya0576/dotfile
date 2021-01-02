" ## Ussage
" install vim-plug( https://github.com/junegunn/vim-plug )
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Run: PlugInstall


" vimrc File Settings ---------------------- {{{
" set autocommand for vimrc 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

nnoremap _ zM
nnoremap + zR
nnoremap <space> za

" make folders open when open later
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
" }}} 


" Common Settings ----------------------------- {{{
syntax enable
set number
set softtabstop=0              " 关闭softtabstop 永远不要将空格和tab混合输入
set colorcolumn=80  " max line 80
set cursorline " 高亮光标所在行
set linebreak " wrap long lines to fit in the window
set synmaxcol=500 " Syntax coloring lines that are too long just slows down the world
set scrolloff=3

" Mac OS X clipboard sharing
set clipboard=unnamed

" When u want to change a habit, make it hard or impossible to do.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Keep search pattern at the center of the screen.
set ignorecase
set incsearch
set smartcase
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" }}}


" Navigation ------------------------------- {{{
" 1. moving cursors 
" ctrl f and ctrl b
" ctrl u and ctrl d
nnoremap <c-d> 15j
nnoremap <c-u> 15k

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Go to top/buttom of the screen, more comfortable switching to <c-d>/<c-e>/... 
" M: move to the middle of the screen
nnoremap <c-h> H
nnoremap <c-l> L

" 2. Screen Positioning
" z + <return>: move the current line to the top of the screen
" ctrl e and ctrl y

" }}}


" InsertMode Quick Edit --------------------{{{
" jk --> <esc>
inoremap jk <esc>l
inoremap <esc> <nop>

" map <esc> <nop>
augroup relative_numbser
autocmd!
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
augroup END

" Moving cursor in insert mode
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>

" enable space/enter in normal mode. 
nnoremap <cr> i<cr><esc>

" }}}

