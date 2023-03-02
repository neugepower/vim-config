
" Vundle plugins "{{{

set nocompatible                       " disable vi-incompatible mode
filetype off				           " required for vundle

call plug#begin()

"Plugin 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/matchit.zip'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jlanzarotta/bufexplorer'
Plug 'craigemery/vim-autotag'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'raimondi/delimitmate'
Plug 'pseewald/anyfold'
Plug 'rust-lang/rust.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'nvie/vim-flake8'
" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" dockerfile
Plug 'ekalinin/Dockerfile.vim'
" tab behavior
Plug 'ervandew/supertab'
" colorschemes
Plug 'michalbachowski/vim-wombat256mod'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
" commenting
Plug 'preservim/nerdcommenter'
" formatting
Plug 'rhysd/vim-clang-format'

call plug#end()


" "}}}

" General "{{{

syntax on                              " syntax highlighting

set nocompatible                       " disable vi-incompatible mode
set enc=utf-8                          " enable utf-8 (vim internal)
set fileencoding=utf-8                 " enable utf-8 also for files
set number                             " enable line numbers
"set foldmethod=marker                  " enable folding by markers
set smartindent                        " enable autoindenting for a new line
set smarttab                           " enable smart tabbing
set shiftwidth=4                       " set shift width (in front of a line, correspondent to smarttab)
set tabstop=4                          " set tab stops (not in front of line)
set softtabstop=4                      " set tab stops (not in front of line)
set expandtab                          " turn tab into spaces
set cursorline                         " mark current line
set tags=./tags,tags;                  " look for a tag file (from current folder until root .)
set wildmode=longest,list,full         " behave more unix like (complete as much as possible)
set wildmenu                           " activate wildmenu
set undofile                           " enable undo files (see also undodir)
set dir=~/.tmp,/tmp,$TEMP              " set for swap files
set undodir=~/tmp,/tmp,$TEMP           " set for undofiles
set backupdir=~/tmp,/tmp,$TEMP         " set for backdir
set laststatus=2                       " show statusline all the time
set backspace=indent,eol,start         " Please Fill Me!!
set hlsearch                           " Highlight search terms
set colorcolumn=120                    " Show colum bar
set textwidth=120                      " Use 120 text width
set visualbell                         " Disable sound
set wrap linebreak nolist              " Soft-break words at textwidth

set ignorecase
set smartcase

set t_Co=256                           " activate 256 colors
let g:solarized_termcolors=256
colorscheme solarized                  " enable color scheme
set background=light                    " using a dark terminal
":hi Error ctermfg=Red ctermbg=242      " especially for wombat + syntastic (gray background instead of red)

" statusline: file name + encoding
set statusline=%f
set statusline+=[%{strlen(&fenc)?&fenc:'none'},\ %{&ff}]

" save foldings
set viewoptions=folds,cursor           " save cursor position and folding on :mkview
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" remove trailing whitespaces while saving
autocmd BufWritePre * :%s/\s\+$//e

" "}}}

" Mapping "{{{

nnoremap <silent> <C-m><Down> :m .+1<CR>==
nnoremap <silent> <C-m><Up> :m .-2<CR>==
inoremap <silent> <C-m><Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <C-m><Up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <C-m><Down> :m '>+1<CR>gv=gv
vnoremap <silent> <C-m><Up> :m '<-2<CR>gv=gv

" Toogle TagList
nnoremap <silent> <leader>b :TagbarToggle<CR>
" Toogle NERDTree
nnoremap <Leader>t :NERDTreeToggle<CR>
" Window switching
" Do not work with Putty
"nnoremap <silent> <A-S-Up> :wincmd k<CR>
"nnoremap <silent> <A-S-Down> :wincmd j<CR>
"nnoremap <silent> <A-S-Left> :wincmd h<CR>
"nnoremap <silent> <A-S-Right> :wincmd l<CR>
noremap <C-w><Up> :wincmd k<CR>
noremap <C-w><Down> :wincmd j<CR>
noremap <C-w><Left> :wincmd h<CR>
noremap <C-w><Right> :wincmd l<CR>
" write file from non root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>
" YCM mapping
nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
" by typing ~~ we exit insert/visual mode
nnoremap `` <Esc>
inoremap `` <Esc>
vnoremap `` <Esc>
" FZF search
nnoremap <silent> <leader>f :FZF<CR>

" Tab handling
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

"}}}

" File specific "{{{

" cpp files
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
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>'] " accept completion
let g:ycm_complete_in_comments = 1

" syntastic
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_warning_symbol = '⚠⚠'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers = ['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" UltiSnips
let g:UltiSnipsExpandTrigger = '<s-right>'
let g:UltiSnipsListSnippets = '<s-down>'
let g:UltiSnipsJumpForwardTrigger = '<right>'
let g:UltiSnipsJumpBackwardTrigger = '<left>'

" Jedi (let ycm take over the control)
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.class$', '.aux$']
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1

" anyfold
let g:anyfold_fold_comments=0       " Fold comments?

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Clang Format
let g:clang_format#command = 'bde-format'

" "}}}


filetype plugin on			            " enable after vundle
filetype indent on			            " enable after vundle

autocmd Filetype * AnyFoldActivate  " activate for all filetypes
set foldlevel=0                     " close all folds
