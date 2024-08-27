"""""""""""""""""""""""""""""""""
"				"
" Command line abbreviations	"
"				"
""""""""""""""""""""""""""""""""" For abbreviation mode.
" Show changes made to the current buffer
cnoreabbr a_diff w !diff % -
" Save readonly files with special permission
cnoreabbr a_wr w !sudo tee %
" codeforces cpp
cnoreabbr cf !g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp
