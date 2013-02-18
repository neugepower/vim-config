
" Vundle plugins "{{{

filetype off				" required for vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Valloric/YouCompleteMe'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/vim-valloric-colorscheme'
Bundle 'bufexplorer.zip'
Bundle 'AutoTag'

" "}}}

" Plugins configuration "{{{

let g:tagbar_width = 50
let g:tagbar_left = 1

" "}}}

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

colorscheme valloric		" enable color scheme

" save foldings
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" "}}}

" Mapping "{{{

" Toogle TagList
map P :TagbarToggle<CR>
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

" File specific "{{{

" force cpp files
au BufRead,BufNewFile *.cci,*.cti,*.ih,*.ct set filetype=cpp

" "}}}

filetype plugin on			" enable after vundle
filetype indent on			" enable after vundle