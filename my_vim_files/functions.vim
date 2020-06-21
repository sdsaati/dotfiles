" Vim module Guard
if exists('did_functions_vim') || &cp || version < 700
	finish
endif
let did_functions_vimdid_functions_vim = 1
" *************** Tutorial ***************
" function!: if that function be existed, it will override it
" but function will not override and show an error

" *************** function for installing plugins ***************
function! Install_all_plugins()
	source ~/my_vim_files/vimrc.vim
	PlugInstall
endfunction

" *************** function for making a comment line in vim ***************
function! Make_comment_line()
	exe 'normal! 0i" *********  *********'
	"exe "normal! o"
endfunction

" ********* making prototype for a function *********
function! Make_prototype()
	" save the current copied texts in @ register
	let temp = @@
	" make a mark (named a) for backing in this line later
	" and copied current line
	exe "normal! mayy"
	" search for Prototypes and press enter to go on it
	exe "normal! /Prototypes\<CR>"
	" )p means go to the end of sentence and paste then
	" go at the end of that line and insert a ; now press
	" Esc button to back in normal mode
	exe "normal! )kpA;\<ESC>"
	" back to the mark a
	exe "normal! 'a"
	" restore the copied text back to register @
	let @@ = temp
endfunction

" ********* Remove whitespaces at the end of each lines while save *********
" autocmd BufWrite * :call DeleteTrailingWS()
function! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunction


" ********* Folder Separator *********
function! DS()
if has('win32') || has ('win64')
	return "\\"
else
	return "/"
endif
endfunction



" ********* For Making the project template, it fills the variables *********
let g:templates_user_variables = [
			\ ['project_folder', 'Get_prj_folder'],
			\ ['source_folder', 'Get_prj_folder'],
			\ ['build_folder', 'Get_build_folder'],
			\ ]
function! Get_prj_folder()
	return expand('%')
endfunction
function! Get_build_folder()
	return Get_prj_folder() . '\..\Build\'
endfunction
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function! RUN_Program(bits,build_folder,executable_file,executable_path)
let l:target=''
" rebuild_cache, build, install, run, clean, edit_cache
" 0               0        0      0     0       0
if(a:bits=='100000')
let l:target.='& make rebuild_cache '
elseif(a:bits=='010000')
let l:target.='& make all '
elseif(a:bits=='001000')
let l:target.='& make install '
elseif(a:bits=='000100')
let l:target.='& cd ' . a:executable_path . ' & "' . a:executable_file . '"'
elseif(a:bits=='000010')
let l:target.='& make clean '
elseif(a:bits=='110000')
let l:target.='& make rebuild_cache & make all '
elseif(a:bits=='111000')
let l:target.='& make rebuild_cache & make all & make install '
elseif(a:bits=='111100')
let l:target.='& make rebuild_cache & make all & make install & cd ' . a:executable_path . ' & "' . a:executable_file . '"'
elseif(a:bits=='010100')
let l:target.='& make & cd ' . a:executable_path . ' & "' . a:executable_file . '"'
elseif(a:bits=='110100')
let l:target.='& make rebuild_cache & make all & cd ' . a:executable_path . ' & "' . a:executable_file . '"'
elseif(a:bits=='000001')
"let l:target.='& runas /env /user:Administrator "make edit_cache" '
let l:target.='& make edit_cache '
endif
execute 'silent ! echo off & cd ' . a:build_folder . ' & color 1b & cls ' . l:target . ' & pause'
endfunction

function! Strip(input_string)
    return substitute(a:input_string, '^\\n*\(.\{-}\)\s*$', '\1', '')
endfunction

function! Make_Autocomplete_jsonfile()
	" Cmake should generate a file that is called
	" compile_commands.json, this file is needed
	" by all of autocompleters, like coc and ycm
	" by setting the below variable in cmake,
	" cmake will generate this file for us,
	" but cmake will generate it in build folder
	" so we have to copy that into our source folder
"-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
endfunction
