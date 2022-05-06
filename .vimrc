" COMPATIBILITY ------------------------------------------------------------ {{{
set nocompatible		" You don't need VI compatiblity
set updatetime=50               " Don't take more than 50 ms time to load

if has ('win32')
	set backspace=indent,eol,start	
				" Backspace key not working in windows version 
				" of VIM. Comment out or del the line for UNIX
	set shell=cmd.exe	" Set cmd	as the default shell in windows
	" set shell=pwsh	" Set pwsh(p6/7)as the default shell in windows 
	" set shell=nu		" Set nu 	as the default shell in windows 
else
	" set shell=sh	 	" Set sh	as the default shell in UNIX
	set shell=bash	 	" Set bash 	as the default shell in UNIX 
	" set shell=zsh	 	" Set zsh 	as the default shell in UNIX 
	" set shell=fish 	" Set fish 	as the default shell in UNIX 
        set clipboard=unnamedplus
				" Copy/Paste between vim and other programs.
endif

" Disable that annoying beeping. 	(might or might not work in linux)
set noerrorbells			
set vb 
" set t_vb=ntax                 " if not working then may uncomment this line 
				" also.

" }}}
" Basic Configuration ------------------------------------------------------ {{{

"""""""""""""""""""""""""""""""""
"				"
"   Auto Group / Auto CMD	"
"				"
"""""""""""""""""""""""""""""""""
"	=> VIM <=		" Folding in VIM 
"				" ('zm' -> foldall | 'zr' -> unfoldall)
"				" This will enable code folding.
"				" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"""""""""""""""""""""""""""""""""
"	=> .vimrc <=		" Some specific settings for .vimrc.
autocmd BufNewFile,BufRead .*vimrc* set tabstop=8 shiftwidth=8 noexpandtab 
"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""
"				"
"	File			"
"				"
"""""""""""""""""""""""""""""""""
filetype off                    " Enable type file detection. Vim will be able 
                                " to try to detect the type of file in use.
filetype plugin indent on	" Enable plugins and load plugin for the 
				" detected file type. Load an indent file for 
				" the detected file type.
set path+=**			" Useful when using :find command. Searches a 
				" dir recursively.
set nobackup        		" No backup.
set noswapfile    		" No swap.
set nowrap        		" No line wrap.
set showmatch       		" Show matching words during a search.
set wildmenu        		" Enable autocompletion menu after pressing TAB.
set wildmode=list:longest	" Make wildmenu behave like similar to Bash 
				" completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx 
                    		" There are certain files that we would never 
				" want to edit with Vim. Wildmenu will ignore 
				" files with these extensions.
"""""""""""""""""""""""""""""""""
"				"
"	Format && Visuals	"
"				"
"""""""""""""""""""""""""""""""""
set number relativenumber	" Number && relative number.
set colorcolumn=80  		" Set a coloured bar at 80th column.
" set cursorline    		" Highlight cursor line underneath the cursor 
				" horizontally.
" set cursorcolumn  		" Highlight cursor line underneath the cursor 
				" vertically.
set encoding=utf-8              " Unicode character support. Default is 'latin1'
" ### set t_Co=256        	" Set if term supports 256 bit colours. 
" ### let g:rehash256 = 1
set guifont="FiraCode Nerd Font"
set splitright      		" Splits files to the right.
set showcmd         		" Show partial command you type in the last 
				" line of the screen.
syntax enable on                " Syntax enabled && on.
"""""""""""""""""""""""""""""""""
"				"
"	Search			"
"				"
"""""""""""""""""""""""""""""""""
set incsearch       		" Increamental search. While searching though a 
				" file incrementally highlight matching 
				" characters as you type.
set ignorecase      		" Ignore capital letters during search.
set smartcase       		" Smartcase rule while searching.
set hlsearch        		" Use highlighting when doing a search.
set history=500     		" Set the commands to save in history default 
				" number is 50.
"""""""""""""""""""""""""""""""""
"				"
"	Mouse && Scroll		"
"				"
"""""""""""""""""""""""""""""""""
set mouse=a			" Mouse support for VIM. 
				" (might or might not work in windows)
set scrolloff=21    		" Do not let cursor scroll below or above N 
				" number of lines when scrolling.
"""""""""""""""""""""""""""""""""
"				"
"	Indentation		"
"				"
"""""""""""""""""""""""""""""""""
set tabstop=4    		" Set tab width to 4 columns.
set autoindent			" Auto indents files.
set smartindent			" Smart indentation.
set shiftwidth=4 		" Set shift width to 4 spaces.
" set expandtab     		" Converts tabs to spaces.
" set smarttab      		" Be smart using tabs ;)
"""""""""""""""""""""""""""""""""
" }}}
" Customized keybindings --------------------------------------------------- {{{

" leader is set to '\' (backslash) by default.

" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press the ';' to go to type command in command mode.
nnoremap ; :
nnoremap ! :!

" Remap ESC to jj to go to the command mode from insert mode.
inoremap jj <Esc>

" Press e to edit a file instead of :e.
nnoremap e :e 

" Press \h to remove highlighting in search.
nnoremap <leader>h :nohl<Enter>

"""""""""""""""""""""""""""""""""
"	Tabs			"
"""""""""""""""""""""""""""""""""
nnoremap <C-t> :tabnew<Enter>
nnoremap te :tabe 
nnoremap <Tab> :tabn<Enter>
nnoremap <S-Tab> :tabp<Enter>
"""""""""""""""""""""""""""""""""
" }}}
" STATUS LINE -------------------------------------------------------------- {{{
" set noshowmode                " Uncomment to prevent non-normal modes showing
                                " in powerline and below powerline.
				" TODO: Only uncomment if vim-airline plugin is 
				" installed and enabled.
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
set statusline+=\ [rc:\ %l\x\%c\]\ 
set statusline+=\ [ascii:\ %b]\ 
set statusline+=\ [hex:\ 0x%B]\ 
set statusline+=\ [percent:\ %p%%]	
" Status line right side.
set statusline+=        
set statusline+=\ -\ buff:\ %-10.3n                     " buffer number  
"}
set laststatus=2        	" Show the status on the second to last line.
set showtabline=2		" Show the tab    on the second to last line.	

" }}}
"PLUGINS ------------------------------------------------------------------- {{{
" vim-plug plugin manager is used
call plug#begin()

"{{ The Basics }}
	Plug 'itchyny/lightline.vim     " Lightline     statusbar. # Keep only 
	Plug 'vim-airline/vim-airline'  " Airline       statusbar. # one of them
	Plug 'vim-airline/vim-airline-themes' 
	Plug 'frazrepo/vim-rainbow'
	let g:rainbow_active = 1
	Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
					" Markdown Preview
	Plug 'jiangmiao/auto-pairs'     " Brackates and quote autopairs.

"{{ File management }}
	Plug 'saifshahriar/vim-startify'
                                        " Startpage for vim.
	" Plug 'vifm/vifm.vim'		" Vifm
	Plug 'scrooloose/nerdtree'	" Nerdtree
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
					" Highlighting Nerdtree
	Plug 'ryanoasis/vim-devicons'	" Icons for Nerdtree

"{{ Productivity }}
	" Plug 'vimwiki/vimwiki'	" VimWiki
	" Plug 'jreybert/vimagit'	" Magit-like plugin for vim
	" Plug 'neoclide/coc-tabnine'   " Tabnine code autocompletion.
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'mattn/emmet-vim'        " Emmet snippets.
	" let g:user_emmet_leader_key='<C->'
     
"{{ Tim Pope Plugins }}
	Plug 'tpope/vim-surround'	" Change surrounding marks.

"{{ Syntax Highlighting and Colors }}
	Plug 'PotatoesMaster/i3-vim-syntax'
	    				" i3 config highlighting.
	Plug 'kovetskiy/sxhkd-vim'	" sxhkd highlighting.
	Plug 'vim-python/python-syntax'	" Python highlighting.
	Plug 'ap/vim-css-color'		" Color previews for CSS.
	Plug 'dense-analysis/ale'
	Plug 'sheerun/vim-polyglot'
	Plug 'scrooloose/syntastic'
	Plug 'jbgutierrez/vim-better-comments'
                                        " Better comments for vim.
	Plug 'fatih/vim-go'             " Golang syntax highlighting.
    
"{{ Junegunn Choi Plugins }}
	" Plug 'junegunn/goyo.vim'	" Distraction-free viewing.
	" Plug 'junegunn/limelight.vim'	" Hyperfocus on a range.
	Plug 'junegunn/vim-emoji'	" Vim needs emojis!
	" Plug 'junegunn/vim-easy-align'  " Easy align.
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	" xmap ga <Plug>(EasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	" nmap ga <Plug>(EasyAlign)
     
"{{Theme Plugins }}
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'gruvbox-community/gruvbox'	
call plug#end()

" }}}
" PLUGINS SETTINGS --------------------------------------------------------- {{{

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd vimenter * NERDTree	" Uncomment to autostart the NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0		" Turns off auto preview
let g:instant_markdown_browser = "firefox"	" Uses surf for preview
" Preview .md file
map <Leader>md :InstantMarkdownPreview<CR>   
" Kills the preview
map <Leader>ms :InstantMarkdownStop<CR>      
set fillchars+=vert:\				
						" Removes pipes | that act as 
						" seperators on splits

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
" }}}
" Themes ------------------------------------------------------------------- {{{
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
" }}}
