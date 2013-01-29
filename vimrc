
" general configurations
set smartindent
set smarttab

set enc=utf-8
set number
set nowrap

" disable vi compatibilty
set nocp

filetype indent on
filetype plugin on

colorscheme desert

set tabstop=4
set shiftwidth=4

" write file from non root vim
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" Python stuff
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Bind window switching
map <silent> <A-Up> :wincmd k<CR>
map <silent> <A-Down> :wincmd j<CR>
map <silent> <A-Left> :wincmd h<CR>
map <silent> <A-Right> :wincmd l<CR>

" show taglist/tasklist/buffer
map T :TaskList<CR>
map P :TlistToggle<CR>
map B :BufExplorer<CR>
map <C-@> <C-]>

" open shell
map S :50split<CR>:wincmd j<CR>:ConqueTerm bash<CR>
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:Tlist_WinWidth = 50

" CPP stuff
let g:clang_use_library = 1
let g:clang_library_path = "/usr/lib/"
let g:clang_complete_auto = 1
let g:clang_close_preview = 1
let g:clang_debug = 1
au BufRead,BufNewFile *.cci,*.cti,*.ih,*.ct set filetype=cpp
