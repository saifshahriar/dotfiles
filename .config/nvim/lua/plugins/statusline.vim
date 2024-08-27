"""""""""""""""""""""""""""""""""
"				"
"	vim-statusline'		"
"				"
""""""""""""""""""""""""""""""""" NOTE: This option is deprecated if any other
				" status line plugin is used (eg. airline,
				" lightline, lualine)
" Status Line1 {  
" set statusline=  
" set statusline+=\ %f
"                                 " Filename
" set statusline+=\ %h%m%r%w
"                                 " Status flags  
" set statusline+=\ [%{strlen(&ft)?&ft:'none'}]
"                                 " File type  
" set statusline+=%=              " Right align remainder  
" set statusline+=\ [rc:\ %l\x\%c\]\ 
" set statusline+=\ [ascii:\ %b]\ 
" set statusline+=\ [hex:\ 0x%B]\ 
" set statusline+=\ [percent:\ %p%%]
"                                 " Status line right side.
" set statusline+=        
" set statusline+=\ -\ buff:\ %-10.3n
                                " Buffer number  
" }

" Status line 2 {
"set statusline=         	" Clear status line when vimrc is reloaded.
"set statusline+=\ %F\ %M\ %Y\ %R
"				" Status line left side.
"set statusline+=%=      	" Use a divider to separate the left side from 
"				" the right side.
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
				" Status line right side.

" Status Line 3 {  		" Preffered one.
set statusline=  
set statusline+=\ %f
" filename
set statusline+=\ %h%m%r%w
" status flags  
set statusline+=\ [%{strlen(&ft)?&ft:'none'}]	
" file type  
set statusline+=%=				" right align remainder  
set statusline+=\ [rc:\ %l\x\%c\]
set statusline+=\ [ascii:\ %b]
set statusline+=\ [hex:\ 0x%B]
set statusline+=\ [percent:\ %p%%]	
" Status line right side.
set statusline+=        
set statusline+=\ -\ buff:\ %-10.3n                     " buffer number  
"}
set laststatus=2        	" Show the status on the second to last line.
set showtabline=2		" Show the tab    on the second to last line.	
