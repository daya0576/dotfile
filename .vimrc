" Vimscript File Settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" 编辑vimrc
nnoremap <leader>ev :vs ~/.vimrc<enter>

" }}}


" Python File Settings ----------------------------{{{
" tab -> indention 
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" }}}


" Common Settings ----------------------------- {{{
" easy window navigation
" nnoremap <c-l> <c-a>l
" nnoremap <c-j> <c-a>j
" nnoremap <c-h> <c-a>h
" nnoremap <c-k> <c-a>k

" When u want to change a habit, make it hard or impossible to do.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=2

syntax enable

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" }}}


" Private Mappings ------------------------------- {{{
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" Go to top/buttom of the screen, more comfortable switching to <c-d>/<c-e>/... 
nnoremap <c-h> H
nnoremap <c-l> L

" jk --> <esc>
inoremap jk <esc>l
" map <esc> <nop>

" enable space/enter in normal mode. 
nnoremap <space> i<space><esc>
nnoremap <cr> i<cr><esc>

" Moving cursor in insert mode
inoremap LL <esc>la
inoremap HH <esc>i

nnoremap <c-d> 15j
nnoremap <c-u> 15k

" }}
