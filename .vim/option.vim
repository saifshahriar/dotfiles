"""""""""""""""""""""""""""""""""
"                               "
"            Shells             "
"                               "
"""""""""""""""""""""""""""""""""
if has ('win32')
	set shell=cmd.exe	" Set cmd	as the default shell in windows
	" set shell=pwsh	" Set pwsh(p6/7)as the default shell in windows
	" set shell=nu		" Set nu 	as the default shell in windows
elseif has ('unix')
	" set shell=sh	 	" Set sh	as the default shell in UNIX
	" set shell=bash	" Set bash 	as the default shell in UNIX
	" set shell=zsh	 	" Set zsh 	as the default shell in UNIX
	" set shell=fish 	" Set fish 	as the default shell in UNIX
	if has ('mac')
		set shell=zsh
	elseif has ('linux')
		set shell=bash
	elseif has ('bsd')
		set shell=sh
	endif
endif
"""""""""""""""""""""""""""""""""
"                               "
"         File Handling         "
"                               "
"""""""""""""""""""""""""""""""""
set nobackup                    " No backup.
set noswapfile                  " No swap.
set nowrap                      " No line wrap.
set undodir=~/.cache/vim/undo | call mkdir(&undodir,   'p')
set undofile
set viminfofile=~/.cache/vim/viminfo
let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')
"""""""""""""""""""""""""""""""""
"                               "
"         Look && Feel          "
"                               "
"""""""""""""""""""""""""""""""""
set colorcolumn=80              " Set a coloured bar at 80th column.
set textwidth=80                " Breaks line after 80th character.
set clipboard=unnamedplus       " Copy/Paste between vim and other programs.
" set cursorline                " Highlight cursor line underneath the cursor 
				" horizontally.
" set cursorcolumn              " Highlight cursor line underneath the cursor 
				" vertically.
" ### set t_Co=256              " Set if term supports 256 bit colours. 
" ### let g:rehash256 = 1

" GUICURSOR for vanilla vim
" Use a line cursor within the insert mode and a block cursor everywhere else.
"
" Reference chart of values:
" Ps = 0    -> blinking block
" Ps = 1    -> blinking (default).
" Ps = 2    -> steady block.
" Ps = 3    -> blinking underline.
" Ps = 4    -> steady underline
" Ps = 5    -> blinking bar
" Ps = 6    -> steady bar
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

set fillchars+=vert:\⎟
				" Removes pipes | that act as 
				" seperators on splits
set guifont=JetBrainsMono\ Nerd\ Font:h15
set hidden
set list
set listchars=tab:\ \ ,trail:
set number relativenumber       " Number && relative number. 
set signcolumn=auto             " Shows extra column to the left side always.
set splitright splitbelow       " Splits files to the right and bottom.
set spell                       " Spellcheck support for vim.
setlocal spell spelllang=en     " en = en_UK
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
set showmatch                   " Show matching words during a search.
"""""""""""""""""""""""""""""""""
"                               "
"            Search             "
"                               "
"""""""""""""""""""""""""""""""""
set hlsearch                    " Use highlighting when doing a search.
set incsearch                   " Increamental search. While searching though a 
				" file incrementally highlight matching 
				" characters as you type.
set ignorecase                  " Ignore capital letters during search.
set smartcase                   " Smartcase rule while searching.
set history=500                 " Set the commands to save in history default 
				" number is 50.
"""""""""""""""""""""""""""""""""
"                               "
"        Mouse && Scroll        "
"                               "
"""""""""""""""""""""""""""""""""
set mouse=a                     " Mouse support for VIM. 
set scrolloff=16                " Do not let cursor scroll below or above N 
				" number of lines when scrolling.
set sidescroll=8                " Same for side scrolling.
"""""""""""""""""""""""""""""""""
"                               "
"          Indentation          "
"                               "
"""""""""""""""""""""""""""""""""
set shiftwidth=4 tabstop=4      " First tab in beginning shifts texts to 4 
				" columns && a tab is 4 columns wide.
set autoindent smartindent      " Auto indents files && smart indentation.
" set expandtab                 " Converts tabs to spaces.
" set smarttab                  " Be smart using tabs ;)
"""""""""""""""""""""""""""""""""
"                               "
"          Statusline           "
"                               "
"""""""""""""""""""""""""""""""""
" set noshowmode                " Uncomment to prevent non-normal modes showing
                                " in powerline and below powerline.
				" TODO: Only uncomment if vim-airline plugin is 
				" installed and enabled.
source $HOME/.vim/plugins/statusline.vim
set laststatus=2                " Show the status on the second to last line.
set showtabline=2               " Show the tab    on the second to last line.	
"""""""""""""""""""""""""""""""""
