let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'  " For Github autocomplete
Plug 'tpope/vim-repeat'  " TODO(lukas): I use this?
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bfredl/nvim-miniyank'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mileszs/ack.vim'
Plug 'psf/black'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

" Sets the line numbers
set number

" Use clipboard for all operations
set clipboard+=unnamedplus

" Enable filetype plugins
filetype plugin on
filetype indent on

let mapleader=","
let g:mapleader=","

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
nmap <BS> <C-W>h
map <C-l> <C-W>l

" Configure splitting
set splitbelow
set splitright

" Set column
set colorcolumn=80

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

nnoremap <Leader>tw :call DeleteTrailingWS()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Access colors present in 256 colorspace
let base16colorspace=256

" Set colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme base16-tomorrow-night

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Enable syntax highlighting
syntax enable

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set relative numbers by default, but add a key binding to toggle
set relativenumber
map <silent> <leader>r :set relativenumber!<CR>

" See live substitutions
set inccommand=split

" set list
" set list
" set lcs+=eol:¬

" Choose eol colors
highlight NonText ctermfg=237

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb  " abbrev for set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search)
map <space> /

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
 let g:airline_theme="bubblegum"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>sc :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/filetypes.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
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
