set termguicolors
set background=dark

let g:tokyonight_transparent_background = 1
let g:tokyonight_enable_italic = 1

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
hi LineNrAbove     guifg=#928374
hi LineNr          guifg=#fabd2f
hi LineNrBelow     guifg=#928374
hi GitGutterAdd    guifg=#009900 ctermfg=Green
hi GitGutterChange guifg=#fadb2f ctermfg=Yellow
hi GitGutterDelete guifg=#ff2222 ctermfg=Red
