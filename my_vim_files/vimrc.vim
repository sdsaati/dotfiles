" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" all of your .vimrc files should source this
" I'm Saeid Saati, sdsaati@gmail.com
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" header guard of this file
if exists('did_vimrc_vim') || &cp || version < 700
	finish
endif
let did_vimrc_vim = 1

set rtp+=~/my_vim_files/vimrc.vim
" Making syntax highliter for vim on/off
" during the RUN, we can use :set syntax=cpp for example
" to force using a special language
syntax on
filetype plugin on
" *************** Settings ***************

" set the home folder
if has('win32') || has ('win64')
	let g:home=expand('<sfile>:p:h:h').'\my_vim_files\'
else
	let g:home=expand('<sfile>:p:h:h').'/my_vim_files/'
endif

" set directory seprator
if has('win32') || has ('win64')
	let g:DS='\'
else
	let g:DS='/'
endif

" Disable auto session saving
:let g:session_autoload = 'no'

" always .prj files are projects
autocmd filetype prj.vim exe 'source %'

:let g:session_autosave = 'no'

" Gvim and Vim, Windows size
"set lines=28
"set columns=80
" vertical line after 80 character
set colorcolumn=80
" Set the character encoding to utf-8
set encoding=utf-8

" Show numbers rnu(relative), nu(numbers)
" and both for hybrid
set nu rnu
" this will highlight current line
set cursorline
" this also highlight current vertical column
set cursorcolumn
set listchars=tab:\|\ 
set list
" this will change current workingdir to file (cd %:h)
set autochdir
set incsearch
set hlsearch
set ignorecase
" Limit search to your project
set nocompatible
" search all subdirectories and recursivley
set path+=**
" Minimal number of screen lines to keep above and below the cursor
set scrolloff=999
set hidden
set ff=unix
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=4
set softtabstop=4
" when indenting with '>', use 2 spaces width
set shiftwidth=4
" in command mode, we havve tab access for completion
set wildmenu
set wildmode=longest:full,full " Display Vim command mode autocompletion list
" Solve the backspace problem in windows
set backspace=2
set backspace=indent,eol,start
" when we create a new windows it's more natural to make it in right and below
set splitbelow
set splitright

" GUI Section:
set mouse=nicr
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" set the , as leader key
let mapleader=","

" set the gvim font
if has('win32') || has ('win64')
set guifont=Fantasque\ Sans\ Mono:h18 "h14
else
"set guifont=Fantasque\ Sans\ Mono\ 18 "h14
"set guifont=Ubuntu\ Mono\ 18 "h14
set guifont=Hack:h14 "h14
"set guifont=Font\ Awesome\ 5\ Free:h14 "h14
endif
" set the python3.6(x86) folder for vim
"set pythonthreehome=~/my_vim_files/python36
"set pythonthreedll=~/my_vim_files/python36/python36.dll
"set pythonhome=~/my_vim_files/python27
"set pythondll=~/my_vim_files/python27/python27.dll

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='light' " can be soft, medium, hard
set background=light " can be light also
"autocmd vimenter * colorscheme gruvbox
autocmd vimenter * colorscheme desert
"autocmd vimenter * colorscheme dracula
" *************** Includes ***************
source ~/my_vim_files/plug.vim
source ~/my_vim_files/plugins.vim
source ~/my_vim_files/functions.vim
source ~/my_vim_files/cpp.vim
source ~/my_vim_files/keybinds.vim
source ~/my_vim_files/coc.vim
source ~/my_vim_files/clang-format.vim
" All Backslashes will convert if we are in linux to slash

if(filereadable(expand('%:p:h').'/'.glob('*project.vim')))
autocmd BufEnter project.vim exe 'source %'
endif

set shellslash
