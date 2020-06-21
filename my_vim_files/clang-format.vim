" YOU HAVE TO put your .clang-format file in the parent folder of all projects
function FormatBuffer()
  if &modified
    let cursor_pos = getpos('.')
     exec 'silent :%! clang-format -style=file'
    call setpos('.', cursor_pos)
  endif
endfunction

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()
