"""""""""""""""""""""""""""""""""
"				"
"   Auto Group / Auto CMD	"
"				"
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"	==> Global <==		"
"""""""""""""""""""""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"""""""""""""""""""""""""""""""""
"	==> VIM	<==		"
"""""""""""""""""""""""""""""""""
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
				" Folding in VIM
				" ('zm' -> fold all | 'zr' -> unfold al)
				" This will enable code folding.
				" Use the marker method of folding.
	autocmd FileType vim set tabstop=8 shiftwidth=8 noexpandtab
augroup END

""" HTML """
autocmd Filetype html setlocal ts=2 sw=2 expandtab
