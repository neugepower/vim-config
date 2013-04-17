
" Vundle plugins "{{{

filetype off				" required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'wincent/Command-T'

Bundle 'bufexplorer.zip'
Bundle 'AutoTag'
Bundle 'a.vim'
" colorschemes
Bundle 'michalbachowski/vim-wombat256mod.git'
Bundle 'molokai'
Bundle 'python.vim'

" "}}}

" General "{{{

syntax on                              " syntax highlighting

set nocompatible                       " disable vi-incompatible mode
set enc=utf-8                          " enable utf-8 (vim internal)
set fileencoding=utf-8                 " enable utf-8 also for files
set number                             " enable line numbers
set nowrap                             " disable line wrapping after 80 chars
set foldmethod=marker                  " enable folding by markers
set smartindent                        " enable autoindenting for a new line
set smarttab                           " enable smart tabbing
set shiftwidth=4                       " set shift width to 4 chars (in front of a line, correspondent to smarttab)
set tabstop=4                          " set tab stops to 4 chars (not in front of line)
set softtabstop=4                      " set tab stops to 4 chars (not in front of line)
set expandtab                          " turn tab into spaces
set cursorline                         " mark current line
set tags=./tags,tags;                  " look for a tag file (from current folder until root .)
set wildmode=longest,list,full         " behave more unix like (complete as much as possible)
set wildmenu                           " activate wildmenu
set undofile                           " enable undo files (see also undodir)
set dir=~/tmp,/tmp,$TEMP               " set for swap files
set undodir=~/tmp,/tmp,$TEMP           " set for undofiles
set laststatus=2                       " show statusline all the time

set ignorecase
set smartcase

set t_Co=256                           " activate 256 colors
colorscheme wombat256mod               " enable color scheme
set background=dark                    " using a dark terminal
:hi Error ctermfg=Red ctermbg=242      " especially for wombat + syntastic (gray background instead of red)

" statusline: file name + encoding
set statusline=%f
set statusline+=[%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]

" save foldings
set viewoptions=folds,cursor           " save cursor position and folding on :mkview
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" "}}}

" Mapping "{{{

" Toogle TagList
nnoremap <silent> <leader>b :TagbarToggle<CR>
" Toogle Command-T
nnoremap <silent> <leader>c :CommandT<CR>
" Toogle BufferList
nnoremap B :BufExplorer<CR>
" Toogle NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
" Window switching
nnoremap <silent> <A-S-Up> :wincmd k<CR>
nnoremap <silent> <A-S-Down> :wincmd j<CR>
nnoremap <silent> <A-S-Left> :wincmd h<CR>
nnoremap <silent> <A-S-Right> :wincmd l<CR>
" write file from non root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" by typing ~~ we exit insert/visual mode
nnoremap `` <Esc>
inoremap `` <Esc>
vnoremap `` <Esc>

" "}}}

" File specific "{{{

" force cpp files
au BufRead,BufNewFile *.cci,*.cti,*.ih,*.ct set filetype=cpp

" "}}}

" Plugins configuration "{{{

let g:tagbar_sort = 1 
let g:tagbar_width = 50

" special mapping for senf (jump between files)
let g:alternateExtensions_cc = "hh,ih"
let g:alternateExtensions_ct = "hh,ih"
let g:alternateExtensions_cti = "hh,ih"
let g:alternateExtensions_cci = "hh,ih"
let g:alternateExtensions_hh = "cc,cci,ct,cti"
let g:alternateExtensions_ih = "cc,cci,ct,cti"

" ycm settings
let g:ycm_autoclose_preview_window_after_completion = 1

" syntastic
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_check_on_open = 1
let g:syntastic_python_checker="flake8"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Jedi (let ycm take over the control)
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$']

" "}}}


filetype plugin on			" enable after vundle
filetype indent on			" enable after vundle
