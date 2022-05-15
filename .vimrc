" COMPATIBILITY ------------------------------------------------------------ {{{
set nocompatible		" You don't need VI compatiblity
set updatetime=50               " Don't take more than 50ms time to load

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
set guifont=FiraCode\ Nerd\ Font\ Mono:h15
"set list 
set listchars=tab:►\ ,trail:·
set signcolumn=yes		" Shows extra column to the left side always.
set splitright      		" Splits files to the right.
set spell			" Spellcheck support for vim.
setlocal spell spelllang=en	" en = en_UK
let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'
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
set clipboard=unnamedplus	" Copy/Paste between vim and other programs.
set mouse=a			" Mouse support for VIM. 
				" (might or might not work in windows)
set scrolloff=21    		" Do not let cursor scroll below or above N 
				" number of lines when scrolling.
set sidescroll=8		" Same for side scrolling.
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
	"Vim Plug ---------------------------------------------------------- {{{
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
	" Damian Conway's plugin ------------------------------------------- {{{
"""""""""""""""""""""""""""""""""
"				"
"	dragvisuals.vim		"
"				"
"""""""""""""""""""""""""""""""""
" Vim global plugin for dragging virtual blocks
" Last change:	Tue Jul 24 07:19:35 EST 2012
" Maintainer:	Damian Conway
" License:	This file is placed in the public domain.

" If already loaded, we're done...
if exists("loaded_dragvirtualblocks")
    finish
endif
let loaded_dragvirtualblocks = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

"====[ Implementation ]====================================

" Toggle this to stop trimming on drags...
if !exists('g:DVB_TrimWS')
    let g:DVB_TrimWS = 1
endif

function! DVB_Drag (dir)
    " No-op in Visual mode...
    if mode() ==# 'v'
        return "\<ESC>gv"

    " Do Visual Line drag indirectly via temporary nmap
    " (to ensure we have access to block position data)...
    elseif mode() ==# 'V'
        " Set up a temporary convenience...
        exec "nnoremap <silent><expr><buffer>  M  \<SID>Drag_Lines('".a:dir."')"

        " Return instructions to implement the move and reset selection...
        return '"vyM'

    " Otherwise do Visual Block drag indirectly via temporary nmap
    " (to ensure we have access to block position data)...
    else
        " Set up a temporary convenience...
        exec "nnoremap <silent><expr><buffer>  M  \<SID>Drag_Block('".a:dir."')"

        " Return instructions to implement the move and reset selection...
        return '"vyM'
    endif
endfunction

function! DVB_Float (dir)
    " No-op in Visual mode...
    if mode() ==# 'v'
        return "\<ESC>gv"

    " Do Visual Line drag indirectly via temporary nmap
    " (to ensure we have access to block position data)...
    elseif mode() ==# 'V'
        " Set up a temporary convenience...
        exec "nnoremap <silent><expr><buffer>  M  \<SID>Float_Lines('".a:dir."')"

        " Return instructions to implement the move and reset selection...
        return '"vyM'

    " Otherwise do Visual Block drag indirectly via temporary nmap
    " (to ensure we have access to block position data)...
    else
        " Set up a temporary convenience...
        exec "nnoremap <silent><expr><buffer>  M  \<SID>Float_Block('".a:dir."')"

        " Return instructions to implement the move and reset selection...
        return '"vyM'
    endif
endfunction

" Duplicate selected block and place to the right...
function! DVB_Duplicate ()
    exec "nnoremap <silent><expr><buffer>  M  \<SID>DuplicateBlock()"
    return '"vyM'
endfunction

function! s:DuplicateBlock ()
    nunmap <buffer>  M
    " Locate block boundaries...
    let [buf_left,  line_left,  col_left,  offset_left ] = getpos("'<")
    let [buf_right, line_right, col_right, offset_right] = getpos("'>")

    " Identify special '$' blocks...
    let dollar_block = 0
    let start_col    = min([col_left+offset_left, col_right+offset_right])
    let end_col      = max([col_left+offset_left, col_right+offset_right])
    let visual_width = end_col - start_col + 1
    for visual_line in split(getreg("v"),"\n")
        if strlen(visual_line) > visual_width
            let dollar_block = 1
            let visual_width = strlen(visual_line)
        endif
    endfor
    let square_up = (dollar_block ? (start_col+visual_width-2).'|' : '')

    set virtualedit=all
    return 'gv'.square_up.'yPgv'
        \. (visual_width-dollar_block) . 'lo' . (visual_width-dollar_block) . 'l'
        \. "y:set virtualedit=block\<CR>gv"
        \. (dollar_block ? 'o$' : '')
endfunction


" Kludge to hide change reporting inside implementation...
let s:NO_REPORT   = ":let b:DVB_report=&report\<CR>:let &report=1000000000\<CR>"
let s:PREV_REPORT = ":let &report = b:DVB_report\<CR>"


" Drag in specified direction in Visual Line mode...
function! s:Drag_Lines (dir)
    " Clean up the temporary convenience...
    nunmap <buffer>  M

    " Locate block being shifted...
    let [buf_left,  line_left,  col_left,  offset_left ] = getpos("'<")
    let [buf_right, line_right, col_right, offset_right] = getpos("'>")

    " Drag entire lines left if possible...
    if a:dir == 'left'
        " Are all lines indented at least one space???
        let lines        = getline(line_left, line_right)
        let all_indented = match(lines, '^[^ ]') == -1

        " If can't trim one space from start of each line, be a no-op...
        if !all_indented
            return 'gv'

        " Otherwise drag left by removing one space from start of each line...
        else
            return    s:NO_REPORT
                  \ . "gv:s/^ //\<CR>:nohlsearch\<CR>"
                  \ . s:PREV_REPORT
                  \ . "gv"
        endif

    " To drag entire lines right, add a space in column 1...
    elseif a:dir == 'right'
        return   s:NO_REPORT
             \ . "gv:s/^/ /\<CR>:nohlsearch\<CR>"
             \ . s:PREV_REPORT
             \ . "gv"

    " To drag entire lines upwards...
    elseif a:dir == 'up'
        let EOF = line('$')

        " Can't drag up if at first line...
        if line_left == 1 || line_right == 1
            return 'gv'

        " Needs special handling at EOF (because cursor moves up on delete)...
        elseif line_left == EOF || line_right == EOF
            let height = line_right - line_left
            let select_extra = height ? height . 'j' : ""
            return   s:NO_REPORT
                 \ . 'gvxP'
                 \ . s:PREV_REPORT
                 \ . 'V' . select_extra

        " Otherwise just cut-move-paste-reselect...
        else
            let height = line_right - line_left
            let select_extra = height ? height . 'j' : ""
            return   s:NO_REPORT
                 \ . 'gvxkP'
                 \ . s:PREV_REPORT
                 \ . 'V' . select_extra
        endif

    " To drag entire lines downwards...
    elseif a:dir == 'down'
        let EOF = line('$')

        " This is how much extra we're going to have to reselect...
        let height = line_right - line_left
        let select_extra = height ? height . 'j' : ""

        " Needs special handling at EOF (to push selection down into new space)...
        if line_left == EOF || line_right == EOF
            return   "O\<ESC>gv"

        " Otherwise, just cut-move-paste-reselect...
        else 
            return   s:NO_REPORT
                 \ . 'gvxp'
                 \ . s:PREV_REPORT
                 \ . 'V' . select_extra
        endif

    endif
endfunction

" Drag in specified direction in Visual Block mode...
function! s:Drag_Block (dir)
    " Clean up the temporary convenience...
    nunmap <buffer>  M

    " Locate block being shifted...
    let [buf_left,  line_left,  col_left,  offset_left ] = getpos("'<")
    let [buf_right, line_right, col_right, offset_right] = getpos("'>")

    " Identify special '$' blocks...
    let dollar_block = 0
    let start_col    = min([col_left+offset_left, col_right+offset_right])
    let end_col      = max([col_left+offset_left, col_right+offset_right])
    let visual_width = end_col - start_col + 1
    for visual_line in split(getreg("v"),"\n")
        if strlen(visual_line) > visual_width
            let dollar_block = 1
            let visual_width = strlen(visual_line)
        endif
    endfor
    let square_up = (dollar_block ? (start_col+visual_width-2).'|' : '')

    " Drag left...
    if a:dir == 'left'
        "Can't drag left at left margin...
        if col_left == 1 || col_right == 1
            return 'gv'

        " Otherwise reposition one column left (and optionally trim any whitespace)...
        elseif g:DVB_TrimWS
            " May need to be able to temporarily step past EOL...
            let prev_ve = &virtualedit
            set virtualedit=all

            " Are we moving past other text???
            let square_up_final = ""
            if dollar_block
                let lines = getline(line_left, line_right)
                if match(lines, '^.\{'.(start_col-2).'}\S') >= 0
                    let dollar_block = 0
                    let square_up_final = (start_col+visual_width-3).'|'
                endif
            endif

            let vcol = start_col - 2
            return   'gv'.square_up.'xhP'
                 \ . s:NO_REPORT
                 \ . "gvhoho:s/\\s\\+$//e\<CR>gv\<ESC>"
                 \ . ':set virtualedit=' . prev_ve . "\<CR>"
                 \ . s:PREV_REPORT
                 \ . ":nohlsearch\<CR>gv"
                 \ . (dollar_block ? '$' : square_up_final )
        else
            return 'gv'.square_up.'xhPgvhoho'
        endif

    " Drag right...
    elseif a:dir == 'right'
        " May need to be able to temporarily step past EOL...
        let prev_ve = &virtualedit
        set virtualedit=all

        " Reposition block one column to the right...
        if g:DVB_TrimWS
            let vcol = start_col
            return   'gv'.square_up.'xp'
                 \ . s:NO_REPORT
                 \ . "gvlolo"
                 \ . ":s/\\s\\+$//e\<CR>gv\<ESC>"
                 \ . ":nohlsearch\<CR>:set virtualedit=" . prev_ve . "\<CR>"
                 \ . s:PREV_REPORT
                 \ . (dollar_block ? 'gv$' : 'gv')
        else
            return 'gv'.square_up.'xp:set virtualedit=' . prev_ve . "\<CR>gvlolo"
        endif

    " Drag upwards...
    elseif a:dir == 'up'
        " Can't drag upwards at top margin...
        if line_left == 1 || line_right == 1
            return 'gv'
        endif

        " May need to be able to temporarily step past EOL...
        let prev_ve = &virtualedit
        set virtualedit=all

        " If trimming whitespace, jump to just below block to do it...
        if g:DVB_TrimWS
            let height = line_right - line_left + 1
            return  'gv'.square_up.'xkPgvkoko"vy'
                    \ . height
                    \ . 'j:s/\s\+$//e'
                    \ . "\<CR>:nohlsearch\<CR>:set virtualedit="
                    \ . prev_ve
                    \ . "\<CR>gv"
                    \ . (dollar_block ? '$' : '')

        " Otherwise just move and reselect...
        else
            return   'gv'.square_up.'xkPgvkoko"vy:set virtualedit='
                    \ . prev_ve
                    \ . "\<CR>gv"
                    \ . (dollar_block ? '$' : '')
        endif

    " Drag downwards...
    elseif a:dir == 'down'
        " May need to be able to temporarily step past EOL...
        let prev_ve = &virtualedit
        set virtualedit=all

        " If trimming whitespace, move to just above block to do it...
        if g:DVB_TrimWS
            return   'gv'.square_up.'xjPgvjojo"vyk:s/\s\+$//e'
                    \ . "\<CR>:nohlsearch\<CR>:set virtualedit="
                    \ . prev_ve
                    \ . "\<CR>gv"
                    \ . (dollar_block ? '$' : '')

        " Otherwise just move and reselect...
        else
            return   'gv'.square_up.'xjPgvjojo"vy'
                    \ . "\<CR>:set virtualedit="
                    \ . prev_ve
                    \ . "\<CR>gv"
                    \ . (dollar_block ? '$' : '')
        endif
    endif
endfunction

" Restore previous external compatibility options
let &cpo = s:save_cpo
	" }}}
" }}}
" PLUGINS SETTINGS --------------------------------------------------------- {{{

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
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
" => Drag Visuals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"##############################################################
"##                                                                     
"##  Add the following (uncommented) to your .vimrc...                  
"##                                                                     
"##     runtime plugin/dragvisuals.vim                                  
"##                                                                     
"##     vmap  <expr>  <LEFT>   DVB_Drag('left')                         
"##     vmap  <expr>  <RIGHT>  DVB_Drag('right')                        
"##     vmap  <expr>  <DOWN>   DVB_Drag('down')                         
"##     vmap  <expr>  <UP>     DVB_Drag('up')                           
vmap  <expr>  D        DVB_Duplicate()                          
"##                                                                     
"##     " Remove any introduced trailing whitespace after moving...     
let g:DVB_TrimWS = 1                                            
"##                                                                     
"##  Or, if you use the arrow keys for normal motions, choose           
"##  four other keys for block dragging. For example:                   
"##                                                                     
vmap  <expr>  h        DVB_Drag('left')                         
vmap  <expr>  l        DVB_Drag('right')                        
vmap  <expr>  j        DVB_Drag('down')                         
vmap  <expr>  k        DVB_Drag('up')                           
"##                                                                     
"##  Or:                                                                
"##                                                                     
"##     vmap  <expr>  <S-LEFT>   DVB_Drag('left')                       
"##     vmap  <expr>  <S-RIGHT>  DVB_Drag('right')                      
"##     vmap  <expr>  <S-DOWN>   DVB_Drag('down')                       
"##     vmap  <expr>  <S-UP>     DVB_Drag('up')                         
"##                                                                     
"##  Or even:                                                           
"##                                                                     
"##     vmap  <expr>   <LEFT><LEFT>   DVB_Drag('left')                  
"##     vmap  <expr>  <RIGHT><RIGHT>  DVB_Drag('right')                 
"##     vmap  <expr>   <DOWN><DOWN>   DVB_Drag('down')                  
"##     vmap  <expr>     <UP><UP>     DVB_Drag('up')                    
"##                                                                     
"##############################################################

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
hi SignColumn guibg=#282828 guifg=#282828
hi LineNrAbove guifg=#928374
hi LineNr guifg=#fabd2f
hi LineNrBelow guifg=#928374

" }}}
