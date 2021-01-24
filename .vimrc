" vimrc File Settings ---------------------- {{{
" set autocommand for vimrc
augroup filetype_vim
autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

nnoremap _ zM
nnoremap + zR

set encoding=utf-8
" }}}

" Common Settings ----------------------------- {{{
" Use 256 colours (Use this setting only if your terminal supports
set t_Co=256
set nu!
set termguicolors

" line numbers 
set number
set relativenumber

" auto save current session 
au BufWinLeave * mkview
au BufWinEnter * silent loadview

set softtabstop=0              " 关闭softtabstop 永远不要将空格和tab混合输入
set linebreak " wrap long lines to fit in the window
set synmaxcol=500 " Syntax coloring lines that are too long just slows down the world
set scrolloff=2
let mapleader=' '

" Mac OS X clipboard sharing
" set clipboard=unnamed

" When u want to change a habit, make it hard or impossible to do.
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Give more space for displaying messages.
set cmdheight=2

"""""""""""""""""" searching """"""""""""""""""""
set ignorecase
set incsearch
set smartcase
" 居中
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" }}}

" Navigation ------------------------------- {{{
" 1. moving cursors {{{
" zj and zk can be used to jump from fold to fold.
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

" Insert newline without entering insert mode
" nmap <S-Enter> O<Esc>j
" nmap <CR> o<Esc>k
" }}}

" 2. Screen Positioning {{{
" z + <return>: move the current line to the top of the screen
" }}}

" }}}

" InsertMode Quick Edit --------------------{{{
inoremap jk <esc>l
" inoremap <esc> <nop>

" Moving cursor in insert mode
imap <C-e> <END>
imap <C-a> <HOME>
imap <C-f> <Right>
imap <C-b> <Left>

" enter in normal mode.
nnoremap <cr> i<cr><esc>

" }}}

" Plugins --------------------{{{
" vim-plugs ----------{{{
" ## Ussage
" install vim-plug( https://github.com/junegunn/vim-plug )
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Run: PlugInstall
call plug#begin('~/.vim/plugged')
" file system
Plug 'preservim/nerdtree'                     " file system explorer
Plug 'jistr/vim-nerdtree-tabs'		      " 可以使 nerdtree 的 tab 更加友好些

" version control
Plug 'airblade/vim-gitgutter'                 " git diff
Plug 'ruanyl/vim-gh-line'                     " 在Bitbucket或github快速打开当前代码行
Plug 'vim-airline/vim-airline'                " shows a git diff in the sign column

" coding
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdcommenter'               " Quick comment
Plug 'terryma/vim-multiple-cursors'           " 多光标编辑
Plug 'majutsushi/tagbar'                      " 当前代码文件中的变量和函数列表的插件
Plug 'jiangmiao/auto-pairs'                   " 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'tpope/vim-surround'

" navigation
Plug 'easymotion/vim-easymotion'

" go 插件
Plug 'fatih/vim-go', { 'tag': '*' }
" 配色
Plug 'flazz/vim-colorschemes'
" Plug 'crusoexia/vim-monokai'
Plug 'sainnhe/sonokai'
Plug 'cormacrelf/vim-colors-github'

call plug#end()
" }}}
" coc settings  --------------------{{{
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" }}}
" NerdTree Settings --------------------{{{
augroup nerdtree_settings
    autocmd!
    " NERDDTree快捷键
    map <leader>t :NERDTreeToggle<CR>
    " 是否显示隐藏文件
    let NERDTreeShowHidden=1
    " 设置宽度
    let NERDTreeWinSize=30
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
augroup END

" NerdComment
" vim 8 / neovim HEAD runtime: when ft==python, cms:=#\ %s
" "   -- when g:NERD
" SpaceDelims==1, then NERDComment results in double space
let g:NERDCustomDelimiters = {
            \ 'python': { 'left': '#', 'right': '' },
            \ 'vim': { 'left': '"', 'right': '' }
            \ }

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
nnoremap <leader>cp :%s/\(print(.*)\)/# \1/g<CR>
nnoremap <leader>cq :%s/# \(print(.*)\)/\1/g<CR>

" }}}
" colorschemes Settings --------------------{{{

let g:solarized_termcolors=256
" let g:molokai_original = 1
let g:github_colors_soft = 1

" https://github.com/chriskempson/vim-tomorrow-theme 
syntax enable
set background=dark
colorscheme tomorrow-night

" }}}

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"}}}
