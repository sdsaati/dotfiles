" Vim module guard
if exists('did_keybinds_vim') || &cp || version < 700
	finish
endif
let did_keybinds_vim = 1
" *************** tutorials ***************
" For each of these sets of mappings, there is a mapping that works in normal, visual, select and operator modes (:map and :noremap), one that works in normal mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap) and so on.

" *************** KeyBinds ***************

" using M instead of ` for going to marks
:nnoremap M `

" jk -> do the esc
inoremap jk <ESC>l

" ,com -> make a comment line in vim
autocm FileType vim nnoremap <leader>com :call Make_comment_line()<cr>

" ,plug -> install all new plugins
nnoremap <leader>plug :call Install_all_plugins()<cr>

" ,noh -> turn off the search highliter
nnoremap <leader>noh :nohlsearch<cr>

" p -> paste something replaced to visual selected data
"      just in visual mod
vnoremap p "_dP

" ,= -> basic calculation
nmap <leader>= i<c-r>=<esc>
imap <leader>= <c-r>=<esc>

" next tab and prev tab
nnoremap <silent> <right> <esc>:tabnext<cr>
nnoremap <silent> <left> <esc>:tabprev<cr>

" ,pro -> making prototype for a function
nnoremap <leader>pro :call Make_prototype()<cr>

" ,tree -> opens and close the NERDTree
map <leader>tree :NERDTreeToggle<CR>

" U -> redo
nnoremap U <c-R>

" ,wl -> goto-right-windows  wr, wj, wk
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>

" ,tl -> goto-right-tab  th,
nnoremap <silent> <leader>tl :tabnext<cr>
nnoremap <silent> <leader>th :tabprev<cr>


" Create the file based on its template
:noremap <F12> :Template<cr>

" BUILD SECTION
" rebuild_cache, build, install, run, clean, edit_cache
"        0         0      0       0     0       0
" f1 -> rebuild
:map <F1> :call RUN_Program('100000',build_folder,executable_file,executable_path)<cr>

" f2 -> build
:map <F2> :call RUN_Program('110000',build_folder,executable_file,executable_path)<cr>

" f3 -> build and run
:map <F3> :call RUN_Program('010100',build_folder,executable_file,executable_path)<cr>

" f4 -> run
:map <F4> :call RUN_Program('000100',build_folder,executable_file,executable_path)<cr>

" f5 -> rebuild and install and run
:map <F5> :call RUN_Program('111100',build_folder,executable_file,executable_path)<cr>

" f6 -> clear
:map <F6> :call RUN_Program('000010',build_folder,executable_file,executable_path)<cr>

" f7 -> edit cache
:map <F7>  :call RUN_Program('000001',build_folder,executable_file,executable_path)<cr>

" space -> fold/unfold
:nmap <space> za
