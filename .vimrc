
" General "{{{

set nocompatible			" disable vi-incompatible mode
set enc=utf-8				" enable utf-8 (vim internal)
set fileencoding=utf-8		" enable utf-8 also for files
set number					" enable line numbers
set nowrap					" disable line wrapping after 80 chars
set foldmethod=marker 		" enable folding by markers
set smartindent				" enable autoindenting for a new line
set smarttab				" enable smart tabbing
set shiftwidth=4			" set shift width to 4 chars (in front of a line, correspondent to smarttab)
set tabstop=4				" set tab stops to 4 chars (not in front of line)

syntax on					" syntax highlighting

colorscheme desert			" enable color scheme

" save foldings
au BufWinLeave * mkview
au BufWinEnter * silent loadview

filetype off				" required for vundle

" "}}}

" Plugins "{{{

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'oblitum/clang_complete'
Bundle 'ervandew/supertab'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'

" "}}}

" Plugins configuration "{{{

" TagList window width
let g:Tlist_WinWidth = 50

" "}}}

" Mapping "{{{

" Toogle TagList
map P :TlistToggle<CR>
" Toogle BufferList
map B :BufExplorer<CR>
" Window switching
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>

" write file from non root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" "}}}

filetype plugin on			" enable after vundle
filetype indent on			" enable after vundle
