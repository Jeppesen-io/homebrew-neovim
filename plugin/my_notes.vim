silent !mkdir ~/.local/notes/ > /dev/null 2>&1

let g:notes_directories = ['~/.local/notes']
let g:notes_suffix = '.md'

" Open note passed in, but if none given, open note with the name of
" open file
function! TakeNote(...)
    let noteToOpen = a:0 > 0 ? a:1 : expand('%:t')
    execute "split  note:". noteToOpen
endfunction

command! -nargs=? TakeNote call TakeNote(<f-args>)
