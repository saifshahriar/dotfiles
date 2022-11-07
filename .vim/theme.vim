set termguicolors
set background=dark

" Vim colorscheme
colorscheme tokyonight

" Airline theme
let g:airline_theme="tokyonight"

" lightline configuration
let g:lightline = {
		\ 'colorscheme': 'tokyonight',
		\ 'active': {
		\ 'right': [ [ 'lightlineinfo' ], 
		\	     [ 'percent' ],
		\	     [ 'lineinfo', 'fileformat', 'fileencoding' , 'filetype' ] ],
		\ 'left': [ [ 'mode', 'paste' ],
		\	    [ 'readonly', 'filename', 'modified' ] ]
		\
		\ },
		\ 'tabline': {
		\ 	'left': [ [ 'tabs' ] ],
		\ 	'right': [ [ 'bufnum' ] ]
		\ },
		\ 'component': {
		\ 	'lineinfo': '%3l:%-2v%<',
		\ },
		\ }
hi LineNrAbove guifg=#928374
hi LineNr guifg=#fabd2f
hi LineNrBelow guifg=#928374
