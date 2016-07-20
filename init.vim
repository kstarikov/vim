set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'shougo/deoplete.nvim'
Plugin 'shougo/unite.vim'
Plugin 'sickill/vim-monokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'vim-erlang/vim-erlang-compiler'
Plugin 'vim-erlang/vim-erlang-tags'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'edkolev/erlang-motions.vim'
Plugin 'sjl/tslime.vim'
Plugin 'thinca/vim-ref'
Plugin 'altercation/vim-colors-solarized'
Plugin 'alem0lars/vim-colorscheme-darcula'
Plugin 'reedes/vim-pencil'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set t_Co=256

let mapleader=","

let g:deoplete#enable_at_startup = 0
set completeopt="menu,longest,preview"

filetype plugin on

" for erlang tags plugin
:set runtimepath^=~/.config/nvim/bundle/vim-erlang-tags

set hidden
execute pathogen#infect()
call pathogen#helptags()

syntax on
set background=dark
colorscheme jellybeans

let g:auto_save = 1

" search
set incsearch
set ignorecase
set hlsearch

set number

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

set history=999

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=4

" tabs
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" indent
" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround
set autoindent
set wrap
set linebreak
set smartindent

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Write swap file to disk after every 50 characters
set updatecount=50

set ruler
set nonumber

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

map ,s :w<cr>

nmap ,b :BufExplorer<cr>
vmap ,b :BufExplorer<cr>

map ,d :bp<cr>
map ,f :bn<cr>

let Tlist_Inc_Winwidth = 1
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 1
let Tlist_Enable_Fold_Column = 0
let tlist_php_settings = 'php;c:class;d:constant;f:function'
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"

set tags=./tags,tags
set tags^=~/work/tags
au VimLeave * :mksession! ~/ide.session

tnoremap <C-[> <C-\><C-n>

" page down with <space>
nmap <space> <pagedown>

nmap <f2> :w<cr>
vmap <f2> <esc>:w<cr>i
imap <f2> <esc>:w<cr>i

map <f6> :bp<cr>
vmap <f6> <esc>:bp<cr>i
imap <f6> <esc>:bp<cr>i
map <f7> :bn<cr>
vmap <f7> <esc>:bn<cr>i
imap <f7> <esc>:bn<cr>i

vnoremap <F8> y<C-w>lpa<cr><C-\><C-n><C-w>h
nnoremap <F8> yap<C-w>lpa<cr><C-\><C-n><C-w>h
tnoremap <F8> <C-\><C-n><C-w>h

map <f10> :bd<cr>
vmap <f10> <esc>:bd<cr>
imap <f10> <esc>:bd<cr>

" F11 - Taglist
map <f11> :TlistToggle<cr>
vmap <f11> <esc>:TlistToggle<cr>
imap <f11> <esc>:TlistToggle<cr>

" F12 - file browser
map <f12> :Ex<cr>
vmap <f12> <esc>:Ex<cr>i
imap <f12> <esc>:Ex<cr>i

nnoremap <silent><c-/> <plug>NERDCommenterToggle <ESC>:call NERDComment(1, "toggle")<cr>

let g:ref_use_vimproc = 1
let g:ref_open = 'split'
let g:ref_cache_dir = expand($TMP . '/vim_ref_cache/')
nno <leader>K :<C-u>Unite ref/erlang
            \ -vertical -default-action=split<CR>

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

nmap <Space>q :q!<cr>

let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set laststatus=0
		set noshowcmd
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set laststatus=2
		set showcmd
	endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪБЮ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}<>,фисвуапршолдьтщзйкыегмцчняхъ;abcdefghijklmnopqrstuvwxyz[]

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
