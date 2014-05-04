" Configuration file for vim

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

" Now we set some defaults for the editor 
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time


" General settings that I like for tabs
set autoindent smartindent
   \ tabstop=4 shiftwidth=4 smarttab expandtab

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Automatic indentation detection
" This must be *prior* to 'set syntax' to be effective
"let mysyntaxfile = "/etc/vim/mysyntax.vim"
"if has("python")
"      py import sys,os; sys.path.append(os.path.expanduser("/etc/vim/"))
"      py import vindect
"endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
set helpfile=$VIMRUNTIME/doc/help.txt.gz

if has("autocmd")
 " Enabled file type detection
 " Use the default filetype settings. If you also want to load indent files
 " to automatically do language-dependent indenting add 'indent' as well.
 filetype plugin on

endif " has ("autocmd")


" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
" set ignorecase		" Do case insensitive matching
" set incsearch		" Incremental search
" set autowrite		" Automatically save before commands like :next and :make

set visualbell
set shiftwidth=4
set tabstop=4
set mouse=a
set showbreak=+\  " Precede continued screen lines
set nowrap        " Do not visually wrap long lines  - do not make it look like there are line breaks where there aren't
set hlsearch

set hidden			" Can work with modified buffers

" Restore cursor position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" use egrep for grepping 
set grepprg=egrep\ -n\ $*\ /dev/null


" Set options for python files
autocmd FileType python setlocal autoindent smartindent
   \ tabstop=8 shiftwidth=4 smarttab expandtab
   \ cinwords=class,def,elif,else,except,finally,for,if,try,while
	
autocmd FileType python
   \ nmap <Leader>p oimport pdb; pdb.set_trace()

augroup filetypedetect
au BufNewFile,BufRead *.stx	setf stx
augroup END

augroup filetype
  au BufRead *.dtml		set ft=html
augroup END

""let g:EnhCommentifyUseAltKeys = 'yes'

"
" handle page templates / html syntax checking
"
"
"augroup filetype
"    au BufWritePost,FileWritePost *.pt,*.zpt,*.cpt make
""  au BufRead *.pt		set ft=zpt
""  au BufWritePost,FileWritePost *.pt make
""  au BufRead *.cpt		set ft=zpt
""  au BufWritePost,FileWritePost *.cpt make
""  au BufRead *.zpt		set ft=zpt
""  au BufWritePost,FileWritePost *.zpt make
"augroup END

"augroup filetype
"  au BufWritePost,FileWritePost *.py,*cpy,*vpy make
"augroup END

autocmd FileType html setlocal
   \ makeprg=weblint\ %
   \ errorformat=%f(%l):\ %m
   \ autoindent smartindent
   \ tabstop=4 shiftwidth=2 smarttab expandtab

autocmd FileType zpt setlocal
   \ autoindent smartindent
   \ tabstop=4 shiftwidth=2 smarttab expandtab
""   \ makeprg=zptlint\ %
""   \ errorformat=%+P***\ Error\ in:\ %f,%Z%*\\s\\,\ at\ line\ %l\\,\ column\ %c,%E%*\\s%m,%-Q
" ... in addition, zpt syntax must load html stuff from mysyntax.vim

augroup filetype
  au BufRead *.zcml		set ft=xml
"  au BufWritePost,FileWritePost *.zcml make
augroup END

" TODO install the custom syntax for it.
augroup filetype
  au BufRead *.kss		set ft=css
augroup END



augroup filetype
  au BufRead *.rst		setlocal ft=rst tw=65
  au BufRead *.rest		setlocal ft=rst tw=65
augroup END





"
" grep plugin settings
"
"
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .arch-ids \{arch\} +\* ,\* .bzr'
let Grep_Skip_Files = '*~ *,v s.* *.pyc *.pyo +* ,* .*.swp .*.swo'
let Grep_Never_Prompt_Cwd = 1

"
" std plugins
"
let NERD_mapleader = "#c"
""""""set runtimepath=~/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vimfiles/after,/etc/vim/after,~/.vim/after,/usr/share/vim-scripts


"
" pathogen (loading)
"

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

autocmd FileType javascript set autoindent smartindent
   \ tabstop=8 shiftwidth=4 smarttab expandtab


if ! has("gui_running") 
"    set t_Co=256 
endif
set background=dark
colorscheme peaksea

""highlight PyFlakes term=underline gui=undercurl guisp=Red
highlight PyFlakes term=reverse ctermbg=1 gui=undercurl guisp=Red guibg=Black
highlight SpellBad term=reverse ctermbg=1 gui=undercurl guisp=Red guibg=Black

set number
set showbreak=\ \ \ \ \ \ \ \ 

""set gfn=Monaco:h14
"set gfn=Consolas:h17
set gfn=Consolas:h16


" supertab and completion
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menu

" enabling showing of marks
call showmarks#ShowMarks('global,enable')
set updatetime=500



let $PYTHONPATH = $HOME."/.vim/src/pyflakes:".$PYTHONPATH
"let $PYTHONPATH = $HOME."/.vim/src/pep8:".$PYTHONPATH
"let $PATH = $HOME."/.vim/bin/:".$PATH

