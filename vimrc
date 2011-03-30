
""""""""""""""""""""""""""""""BASIC SETTINGS"""""""""""""""""""""""""""""

" Fix backspace on some remote hosts.
    set t_kb=

" Printing hardcopies
    set background=dark " If you use a dark background
    set printoptions=number:y

" Line numbers
    set number
    set numberwidth=6

" Ruler
    set ruler           " show the ruler
    " Ruler format was mixed and matched from http://proasix.com/hlp/contract/adi/hlp/vim.hlp
    set rulerformat=%-50(%n:%f%r%m%w%y%)%=%5(%p%%%)%=%6(\(%l,%)%=%-4(%c\)%)%=%4(0x%B%)%=%8(%)
    set showcmd         " show partial commands in status line and
    set showmode        " show 'Insert', 'Replace', 'Visual' when in those modes


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
    set scrolloff=2     " minimum lines to keep above and below cursor

" Document width and long lines
    "set textwidth=73    " width @ which to break long sentences onto new lines
    set wrap            " long lines won't run off the screen

" General filetype and syntax options
    syntax on
    filetype indent on  " autoindent based on filetype 
    filetype plugin on  " allow filetype plugins

"""""""""""""""""""""""""""""ADVANCED SETTINGS"""""""""""""""""""""""""""

" Determine the operating system being used.
    let platform = substitute(system('uname'), "\n", "", "")
    if platform == "Darwin"
        let platform = "MacOSX"
    elseif platform == "SunOS"
        let platform = "Solaris"
    endif " 'Linux' and 'FreeBSD' need not be changed.

" vim-latex customization
    "let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
    let g:Tex_DefaultTargetFormat = 'pdf'
    let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
    let g:Tex_FormatDependency_ps = 'dvi,ps'
    " let g:Tex_MultipleCompileFormats = 'dvi ps pdf'
    let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode -output-format=dvi "$*"'
    let g:Tex_CompileRule_ps = 'dvips $*.dvi'
    let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

" Mapping Keys.
    " Set the leader key to one convinient on dvorak.
    let mapleader = ","
    " buffer switch mapping
    map <leader>b :buffers<CR>:buffer<Space>
    " NERDTree toggle mapping
    map <leader>d :NERDTreeToggle<return>
    " qtemp template insertion
    map <leader>t I<return><esc>d0kV!qtemp<Space>
    " Copy paste map
    if platform == "MacOSX"
        map <leader>p A<return><esc>V!pbpaste<return>
        map <leader>P a<return><return><esc>d0kV!pbpaste<return>
        map <leader>y V!pbcopy<return>u
        map <leader>x V!pbcopy<return>
    elseif platform == "Linux" " This does not work as well as in Mac OS X.
        map <leader>p A<return><esc>V!xclip -o<return>
        map <leader>P a<return><return><esc>d0kV!xclip -o<return>
        map <leader>y V!xclip -i<return>u
        map <leader>x V!xclip -i<return>
    endif " TODO: Add other operating systems if possbile.

if has("autocmd")

" Filetype options (au = autocmd)
    " File types where tabs are important
    au BufNewFile,BufRead  Makefile,makefile set noexpandtab
    au BufNewFile,BufRead  *.rdb set noexpandtab

    " Filetypes where you do not want to cut long lines.
    au BufNewFile,BufRead *.tex,*.bib set textwidth=0
    au BufNewFile,BufRead  *.bb set textwidth=0

    " Some stuff that should be fine if left alone.
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
    au BufNewFile,BufRead  *.pls            set syntax=dosini
    au BufNewFile,BufRead  modprobe.conf    set syntax=modconf

    " Try and deal with broken-ness in buffers for new files.
    au BufNewFile,BufRead *.perl,*.pl,*.pm  set syntax=perl
    au BufNewFile,BufRead *.py              set syntax=python
    au BufNewFile,BufRead *.rb              set syntax=ruby
endif
