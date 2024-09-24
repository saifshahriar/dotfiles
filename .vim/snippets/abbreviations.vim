"""""""""""""""""""""""""""""""""
"				"
" Command line abbreviations	"
"				"
""""""""""""""""""""""""""""""""" For abbreviation mode.
" Show changes made to the current buffer
cnoreabbr a_diff w !diff % -
" Save readonly files with special permission
cnoreabbr a_wr w !sudo tee %

autocmd FileType c,cpp inoreabbr ll long long
autocmd FileType c,cpp inoreabbr ld long double
