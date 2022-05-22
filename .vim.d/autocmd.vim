"""""""""""""""""""""""""""""""""
"				"
"   Auto Group / Auto CMD	"
"				"
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
"	==> VIM	<==		"
"""""""""""""""""""""""""""""""""
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
				" Folding in VIM
				" ('zm' -> foldall | 'zr' -> unfoldall)
				" This will enable code folding.
				" Use the marker method of folding.
	autocmd BufNewFile,BufRead,FileType vim set tabstop=8 shiftwidth=8 noexpandtab
augroup END
