set number
set numberwidth=6

" Tabs and formatting
set shiftwidth=4    " indent width (shiftwidth == tabstop always, imho)
set tabstop=4       " tabs go to next column c s.t. c % 4 == 0
set expandtab       " tabs input are expanded to spaces
set smarttab        " delete initial indentations easily on new lines

" Searching
set hlsearch        " Highlight search matches
set smartcase       " case insensitive is one directional?
" make hitting escape twice in normal mode remove search highlighting
noremap <esc><esc> :noh<CR><esc>

" Navigating
set scrolloff=3     " minimum lines to keep above and below cursor

" Document width
"set textwidth=73    " width @ which to break long sentences onto new lines
"set wrap            " long lines won't run off the screen

" General filetype and syntax options
syntax on
filetype indent on  " autoindent based on filetype 
filetype plugin on  " allow filetype plugins

" Set the leader key to one convinient on dvorak.
let mapleader = ","

" buffer switch prompt with '<leader>b'
map <leader>b :buffers<CR>:buffer<Space>

if has("autocmd")

" Filetypes (au = autocmd)
au FileType helpfile set nonumber      " no line numbers when viewing help
au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back

" Files and file formats
au BufNewFile,BufRead  *.pls    set syntax=dosini
au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
au BufNewFile,BufRead  Makefile,makefile set noexpandtab
au BufNewFile,BufRead  *.rdb set noexpandtab

" What.CD posts
au BufNewFile,BufRead  *.bb set textwidth=0

endif
