let mapleader=","

set completeopt = "menu,longest,preview"

syntax on
filetype plugin on

colorscheme desert

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

set hidden

" search
set incsearch
set ignorecase
set hlsearch

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
au VimLeave * :mksession! ~/ide.session

" page down with <space>
nmap <space> <pagedown>
nmap <c-u> <pageup>

" F2 - saving
nmap <f2> :w<cr>
vmap <f2> <esc>:w<cr>i
imap <f2> <esc>:w<cr>i

" F6 - предыдущий буфер
map <f6> :bp<cr>
vmap <f6> <esc>:bp<cr>i
imap <f6> <esc>:bp<cr>i
" F7 - следующий буфер
map <f7> :bn<cr>
vmap <f7> <esc>:bn<cr>i
imap <f7> <esc>:bn<cr>i

" F10 - delete buffer
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
