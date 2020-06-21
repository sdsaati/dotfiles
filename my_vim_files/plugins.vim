" Vim module guard
if exists('did_plugins_vim') || &cp || version < 700
	finish
endif
let did_plugins_vim = 1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $home.'vimrc.vim'
endif
call plug#begin(home.'plugins')
" <<<

" using clang for autocompletion for c++
"Plug 'rip-rip/clang_complete'
" path to directory of clang
if has('win32') || has ('win64')
let g:clang_library_path=home.'clang-format\LLVM\bin'
endif

" Auto completion, intellisense, goto defenitions ... with coc
" for installing c++ and other language severs (for coc working)
" YOU HAVE TO RUN THIS COMMAND AFTER INSTALLING COC:
" :CocInstall coc-clangd coc-tsserver coc-json coc-html coc-python coc-phpls coc-css coc-cmake coc-yaml coc-cssmodules
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
let g:lsp_cxx_hl_use_text_props = 1
let g:coc_global_config=home."plugins/coc.nvim/coc-settings.json"

" You Complete me is an autocomplete tools that is great
"Plug 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = home.'plugins/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1

" snippet engine for vim
"Plug 'SirVer/ultisnips'
" snippets files
"Plug 'honza/vim-snippets'
" hotkey for snipper trigger
"let g:UltiSnipsExpandTrigger='<leader>jj' "'<C-j>'
" Session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" NERDtree
Plug 'scrooloose/nerdtree'
" start nerdtree automatically whenever vim starts
autocmd vimenter * NERDTree
" close vim if NERD is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * execute('wincmd l')


" Ctrp
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" clang-format for formating the files
Plug 'rhysd/vim-clang-format'
if has('win32') || has ('win64')
autocmd FileType c,cpp,objc ClangFormatAutoEnable
endif

" Runing external applications
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" CMake project management (they are all useless :/)
"Plug 'vhdirk/vim-cmake'
"Plug 'jalcine/cmake.vim'
"Plug 'ilyachur/cmake4vim'

" CMake hightlighter
Plug 'pboettch/vim-cmake-syntax'

"vim-surround
Plug 'tpope/vim-surround'

" Template manager for files documentation is :help template.txt
Plug 'aperezdc/vim-template'
let g:templates_global_name_prefix='t_'
let g:templates_directory=home.'templates'
" VimEnter wait until all plugins load and then will execute
"autocmd VimEnter project.vim exe 'Template *.project.vim'

" Vim dispatcher that cause open make files async in another window
Plug 'tpope/vim-dispatch'

" vimwiki :)
Plug 'vimwiki/vimwiki'

" Doxygen with its configs
Plug 'vim-scripts/DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:DoxygenToolkit_blockFooter="~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
let g:DoxygenToolkit_authorName="Saeid Saati"
let g:DoxygenToolkit_licenseTag="GPL3"

" C++ addetional highlighter
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1
let c_no_curly_error=1

" a little them things :D
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='light theme'
let g:airline_powerline_fonts=1

" gruvebox theme
Plug 'morhetz/gruvbox'

" dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" >>>
call plug#end()


