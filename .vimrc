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
let mapleader=','

" Mac OS X clipboard sharing
set clipboard=unnamed

" When u want to change a habit, make it hard or impossible to do.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"""""""""""""""""" searching """"""""""""""""""""
set ignorecase
set incsearch
set smartcase
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
"""""""""""""""""""""""""""""""""""""""""""""""""
" }}}

" Navigation ------------------------------- {{{

" 1. moving cursors {{{
" zj and zk can be used to jump from fold to fold.
" ctrl f and ctrl b
" ctrl u and ctrl d
nnoremap <c-d> 15j
nnoremap <c-u> 15k

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Go to top/buttom of the screen
" M: move to the middle of the screen
nnoremap <c-h> H
nnoremap <c-l> L

" :jumps remembers the locations you have recently visited
" Ctrl-O to jump back to the previous (older) location
" Ctrl-I next (newer) 

" }}}

" 2. Screen Positioning {{{
" z + <return>: move the current line to the top of the screen
" ctrl e and ctrl y
" }}}

" }}}

" InsertMode Quick Edit --------------------{{{
inoremap jk <esc>l
" inoremap <esc> <nop>

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

" Language  --------------------{{{
" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" }}}

" Plugins --------------------{{{
" vim-plug ----------{{{
" ## Ussage
" install vim-plug( https://github.com/junegunn/vim-plug )
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Run: PlugInstall

call plug#begin('~/.vim/plugged')

" file system
Plug 'preservim/nerdtree'                     " file system explorer
Plug 'ctrlpvim/ctrlp.vim'                     " 模糊查找

" version control
Plug 'airblade/vim-gitgutter'                 " git diff
Plug 'ruanyl/vim-gh-line'                     " 在Bitbucket或github快速打开当前代码行
Plug 'tpope/vim-fugitive'                     " git插件 （Blame)

" theme
Plug 'vim-airline/vim-airline'                " shows a git diff in the sign column
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

" coding 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'               " Quick comment
Plug 'terryma/vim-multiple-cursors'           " 多光标编辑
Plug 'godlygeek/tabular'                      " 自动根据某个符号对其

Plug 'stephpy/vim-yaml'
Plug 'nvie/vim-flake8'
Plug 'gabrielelana/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'nathangrigg/vim-beancount'
Plug 'aklt/plantuml-syntax'

" debug(local)
Plug 'tweekmonster/startuptime.vim'           " Vim start up time debug

" TODO:
Plug 'benmills/vimux'
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

call plug#end()
" }}}

" NerdTree Settings --------------------{{{
augroup nerdtree_settings
    autocmd!
    " NERDDTree快捷键
    map <leader>t :NERDTreeToggle<CR>
    map <C-n> :NERDTreeToggle<CR>
    " 是否显示隐藏文件
    let NERDTreeShowHidden=1
    " 设置宽度
    let NERDTreeWinSize=30
    " 在终端启动vim时，共享NERDTree
    let g:nerdtree_tabs_open_on_console_startup=1
    " 忽略一下文件的显示
    let NERDTreeIgnore=['\.pyc','\~$',
                \ '\.swp',
                \ '\.o',
                \ '.DS_Store',
                \ '\.orig$',
                \ '@neomake_',
                \ '.coverage.',
                \ '__pycache__$[[dir]]',
                \ '.pytest_cache$[[dir]]',
                \ '.git$[[dir]]',
                \ '.idea[[dir]]',
                \ '.vscode[[dir]]',
                \ 'htmlcov[[dir]]',
                \ 'test-reports[[dir]]',
                \ '.egg-info$[[dir]]']
    " 显示书签列表
    let NERDTreeShowBookmarks=1
    " 改变nerdtree的箭头
    " let g:NERDTreeDirArrowExpandable = '?'
    " let g:NERDTreeDirArrowCollapsible = '?'
    " vim不指定具体文件打开是，自动使用nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree |endif

    " 当vim打开一个目录时，nerdtree自动使用
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " 打开新的窗口，focus在buffer里而不是NerdTree里
    autocmd VimEnter * :wincmd l

    " 当vim中没有其他文件，值剩下nerdtree的时候，自动关闭窗口
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" NerdComment
" vim 8 / neovim HEAD runtime: when ft==python, cms:=#\ %s
" "   -- when g:NERDSpaceDelims==1, then NERDComment results in double space
let g:NERDCustomDelimiters = {
            \ 'python': { 'left': '#', 'right': '' },
            \ 'vim': { 'left': '"', 'right': '' }
            \ }

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nnoremap <leader>cp :%s/\(print(.*)\)/# \1/g<CR>
nnoremap <leader>cq :%s/# \(print(.*)\)/\1/g<CR>

set background=dark
" colorscheme molokai

" }}}

" }}}
