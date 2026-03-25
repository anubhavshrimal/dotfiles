set nocompatible " not vi compatible
"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

filetype plugin indent on " enable file type detection
set autoindent

set nu " number lines
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set scrolloff=5 " show lines above and below cursor (when possible)

set backspace=indent,eol,start " allow backspacing over everything

" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)
set nofoldenable " disable folding by default
set noerrorbells visualbell t_vb= " disable audible bell

" Clipboard: native on local, OSC 52 over SSH
if has('clipboard')
    set clipboard=unnamed
else
    function! OSCYank()
        let text = getreg('"')
        let encoded = system('echo -n ' . shellescape(text) . ' | base64 | tr -d "\n"')
        call writefile(["\x1b]52;c;" . encoded . "\x07"], '/dev/tty', 'b')
    endfunction
    autocmd TextYankPost * if v:event.operator ==# 'y' | call OSCYank() | endif
endif

" markdown
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'javascript',
    \ 'json',
    \ 'python',
    \ 'yaml',
\]
let g:markdown_syntax_conceal = 0
let g:markdown_folding = 1

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
