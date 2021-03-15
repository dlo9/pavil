""""""""""""""""""""""""""""""""""""""""""""""""
"" Inspired by https://amix.dk/vim/vimrc.html ""
""""""""""""""""""""""""""""""""""""""""""""""""

" Enable line numbers
set number

" Use 256-bit color
set t_Co=256
" For some reason necessary for correct colors in tmux
set background=dark

" Highlight lines over 80 characters
" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=DarkRed ctermfg=White guibg=#FFD9D9
"match OverLength /\%81v.\+/

""""""""""""""""""""
"" Plugin Manager ""
""""""""""""""""""""

" Auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Run :PlugInstall to install plugins
call plug#begin('~/.vim/plugged')
Plug 'deviantfero/wpgtk.vim'
Plug 'dylanaraps/wal'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'ajh17/VimCompletesMe'
Plug 'saltstack/salt-vim'
" Load plugins on first use of insert mode, shaving 160+ ms off start-up:
" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup load_load_insert
autocmd!
autocmd InsertEnter * call plug#load('YouCompleteMe') | autocmd! load_load_insert
augroup END
call plug#end()

" Auto-install missing plugins on startup, with negligible impact
" https://github.com/junegunn/vim-plug/wiki/extra#automatically-install-missing-plugins-on-startup
autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif

"""""""""""""
"" Airline ""
"""""""""""""

" Enable top bar
let g:airline#extensions#tabline#enabled = 1

" Use powerline arrows
let g:airline_powerline_fonts = 1

"""""""""""""
"" General ""
"""""""""""""

" Command lines to remember
set history=80

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" Turn on spell checking
setlocal spell spelllang=en_us

""""""""
"" UI ""
""""""""

" Number of lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Backspace should delete all characters
set backspace=indent,eol,start

" Move to next line when at EOL
set whichwrap+=<,>,h,l

" Don't redraw while executing macros
set lazyredraw

" Use GREP regex characters
set magic

" Show matching brackets when cursor is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=5

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

""""""""""""
"" Search ""
""""""""""""

" Ignore case
set ignorecase

" Unless the search contains a capital
set smartcase

" Highlight results
set hlsearch

" Search as you type
set incsearch

""""""""""""""""""""""
"" Colors and Fonts ""
""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""
"" Files, backups and undo ""
"""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc anyway...
"set nobackup
"set nowb
"set noswapfile

""""""""""""""""""""""""""""""""""
"" Text, tab and indent related ""
""""""""""""""""""""""""""""""""""

" Backspace removes <tabstop> spaces from the start of the line
"set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linewrap obeys word boundaries
set linebreak
"set textwidth=5
"set wrap "Wrap lines

set autoindent "Auto indent
set smartindent "Smart indent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Control+Arrow jumps between words/lines
map Od <c-left>
map Ob <c-down>
map Oa <c-up>
map Oc <c-right>
map! Od <c-left>
map! Ob <c-down>
map! Oa <c-up>
map! Oc <c-right>

" Shift-Tab should behave as expected
inoremap <Esc>[Z <C-d>

" TODO: Haven't reviewed past this line
" Treat long lines as break lines (useful when moving around in them)
" TODO: doesn't seem to work
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
" TODO: doesn't seem to work
map <silent> <leader><cr> :noh<cr>

" Faster window jumps
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close all the buffers
" TODO: doesn't seem to work (map to q!! or qa if it does?)
" map <leader>bd :Bclose<cr>
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
set switchbuf=useopen,usetab,newtab
set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
" Remember info about open buffers on close
" Store up to 1000 lines in each buffer
set viminfo^=%,<1000


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""
"" Spell checking ""
""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
" TODO: doesn't seem to work?
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Change spellcheck highlighting to underline
" https://stackoverflow.com/questions/6008921/how-do-i-change-the-highlight-style-in-vim-spellcheck
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
hi clear SpellLocal
hi SpellLocal cterm=underline,bold ctermfg=green
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline

""""""""""
"" Misc ""
""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>

""""""""""""""""""""""
"" Helper functions ""
""""""""""""""""""""""
function! CmdLine(str)
exe "menu Foo.Bar :" . a:str
emenu Foo.Bar
unmenu Foo
endfunction

function! VisualSelection(direction) range
let l:saved_reg = @"
execute "normal! vgvy"

let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")

if a:direction == 'b'
execute "normal ?" . l:pattern . "^M"
elseif a:direction == 'gv'
call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
elseif a:direction == 'replace'
call CmdLine("%s" . '/'. l:pattern . '/')
elseif a:direction == 'f'
execute "normal /" . l:pattern . "^M"
endif

let @/ = l:pattern
let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute("bdelete! ".l:currentBufNum)
endif
endfunction

"""""""""""""""
"" Filetypes ""
"""""""""""""""

autocmd FileType nix setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
