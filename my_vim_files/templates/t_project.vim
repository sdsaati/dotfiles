" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~~~    Author: Saeid Saati   ~~~~~
" ~~~~~   Date: %FDATE% ~~~~~
" ~~~~~ Email: sdsaati@gmail.com ~~~~~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" This is a project file for vim
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" -> 1) CHANGE THESE THREE VARIABLE BELOW
" -> 2) WORK ON THE PROJECT
" -> 3)  PRESS F1 FOR REBUILD
" -> 3-1)      F2 FOR BUILD
" -> 3-2)      F3 FOR BUILD AND RUN
" -> 3-3)      F4 FOR RUN
" -> 3-4)      F5 FOR REBUILD AND INSTALL AND RUN
" -> 3-5)      F6 FOR CLEAER
" -> 3-6)      F7 FOR EDIT THE CACHE

let g:executable_name='Name.exe'
let g:project_folder=trim(system("cd ".expand("%:p:h")." & cd"))
let g:source_folder=g:project_folder
let g:build_folder=trim(system("cd ".g:project_folder."/../Build/ & cd"))
let g:install_folder=trim(system("cd ".g:project_folder."/../Install/ & cd"))
let g:executable_file=trim(g:build_folder."/src/".g:executable_name)
let g:executable_path=trim(system("cd ".g:build_folder."/src/ & cd"))

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~~~ You Don't need to change below
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" run ninja ------>>>>   execute '! cd  . project_folder . ' & ninja all'
let g:session_directory=g:project_folder
" check if there is a session file,
" if there is one, then we should
" load it
if (filereadable('session.vim'))
	OpenSession! session
	execute("wincmd l")
	execute 'NERDTreeFind'
	execute("wincmd l")
else
	" set current directory(project direcotry)
	" as working directory for vim
	cd %:p:h
	NERDTreeClose
	NERDTreeCWD
	execute("wincmd l")
	NERDTreeFind
	execute("wincmd l")
	SaveSession! session
endif
set syntax=vim




