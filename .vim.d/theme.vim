set termguicolors
set background=dark

" Vim colorscheme
colorscheme gruvbox

" Airline theme
let g:airline_theme="gruvbox"

" lightline configuration
let g:lightline = {
		\ 'colorscheme': 'gruvbox',
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
hi SignColumn guibg=#282828 guifg=#282828
hi LineNrAbove guifg=#928374
hi LineNr guifg=#fabd2f
hi LineNrBelow guifg=#928374
