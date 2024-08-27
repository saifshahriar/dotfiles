local M = {}

vim.cmd([[
	set updatetime=50               " Don't take more than 50ms time to load

	if has ('win32')
		set backspace=indent,eol,start
	endif

	set noerrorbells
	" set vb
	" set t_vb=ntax                 " if not working then may uncomment this line
									" also.
	filetype off                    " Enable type file detection. Vim will be able
									" to try to detect the type of file in use.
	filetype plugin indent on       " Enable plugins and load plugin for the
									" detected file type. Load an indent file for
									" the detected file type.
	set path+=**                    " Useful when using :find command. Searches a
									" dir recursively.
	set wildmenu                    " Enable autocompletion menu after pressing TAB.
	set wildmode=list:full          " Make wildmenu behave like similar to Bash
									" completion.
	set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
									" There are certain files that we would never
									" want to edit with Vim. Wildmenu will ignore
									" files with these extensions.
	set encoding=utf-8              " Unicode character support. Default is 'latin1'
	set showcmd                     " Show partial command you type in the last
									" line of the screen.
	set undofile                    " Persistent undo to file.
	syntax enable on                " Syntax enabled && on.
	setglobal modeline
]])

return M
