"function FormatBuffer()
""    if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
""        let cursor_pos = getpos('.')
""        :%!clang-format
""        call setpos('.', cursor_pos)
""    endif
"endfunction

"autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

"map <C-k> :py3f /usr/share/clang/clang-format.py<CR>

"function! Formatonsave()
"  let l:formatdiff = 1
"    py3f /usr/share/clang/clang-format.py
"endfunction
"autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Formatonsave()

"nnoremap <C-k> :%!clang-format -style=file<CR>

map <C-K> :py3f /usr/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:py3f /usr/share/clang/clang-format.py<cr>
