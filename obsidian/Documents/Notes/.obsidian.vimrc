" CONVENIENCE
" ----------------
"Make ";" synonymous with ":" to enter commands
nmap ; :

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk


" SUBLIME COMMANDS
" ----------------
" Store and paste in clipboard
" <C-c> and <C-v>
unmap <C-c>
unmap <C-v>
unmap <C-x>

" Redo with U or Ctrl+y instead of Ctrl+R
" Undo with u or Ctrl+z
nmap U     <C-r>
nmap <C-y> <C-r>
nmap <C-z> u
