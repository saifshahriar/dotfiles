" COMPATIBILITY 	---------- ---------- ---------- ---------- ---------- {{{
if has ('win32')
	set backspace=indent,eol,start 	  " Backspace key not working in windows version of VIM
	set shell=pwsh			  " Set pwsh as windows default shell
endif
set nocompatible                    " Disable compatibility with VI which can cause unexpected error
                                    " ! Required [DT] => opp
" }}}

" Basic Configuration 	---------- ---------- ---------- ---------- ----------  {{{
set nu rnu
set mouse=a
set mouse=nicr
syntax enable on

" Disable that annoying beeping
set noerrorbells
set vb t_vb=ntax 

" Folding in VIM ('zm' -> fold | 'zr' -> unfold)
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
filetype off                        " Enable type file detection. Vim will be able to try to detect the type of file in use.
                                    " ! Required [DT] => opp
filetype plugin indent on           " Enable plugins and load plugin for the detected file type.
                                    " Load an indent file for the detecte
                                    " ! Required [DT]
"set clipboard=unnamedplus " Copy/Paste between vim and other programs.
set incsearch       " Increamental search. While searching though a file incrementally highlight matching characters as you type.
set ignorecase      " Ignore capital letters during search.
set smartcase       " Override the ignorecase option if searching for capital letters.
                    " This will allow you to search specifically for capital letters.
set hlsearch        " Use highlighting when doing a search.
set history=500     " Set the commands to save in history default number is 20.
set path+=**
set nobackup        " Do not save backup files.
" set noswapfile    " No swap
" set nowrap        " Do not wrap lines. Allow long lines to extend as far as the line goes.
set t_Co=256        " Set if term supports 256 bit colours. 
set scrolloff=21    " Do not let cursor scroll below or above N number of lines when scrolling.
let g:rehash256 = 1
set splitright      " Splits files to the right 
set showcmd         " Show partial command you type in the last line of the screen.
set showmatch       " Show matching words during a search.
set wildmenu        " Enable auto completion menu after pressing TAB.
set wildmode=list:longest   " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx 
                    " There are certain files that we would never want to edit with Vim.
                    " Wildmenu will ignore files with these extensions.
" set cursorline    " Highlight cursor line underneath the cursor horizontally.
" set cursorcolumn  " Highlight cursor line underneath the cursor vertically.
" set shiftwidth=10 " Set shift width to 4 spaces.
" set tabstop=4     " Set tab width to 4 columns.
" set expandtab     " Use spaces instead of tabs.
" set smarttab      " Be smart using tabs ;)
" }}}
" Customized keybindings ---------- ---------- ---------- ---------- ---------- {{{
" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press the ';' to go to type command in command mode.
nnoremap ; :
nnoremap ! :!

" Remap ESC to jj to go to the command mode.
inoremap jj <Esc>

" e -> :e .
nnoremap e :e 
" }}}
" STATUS LINE ------------------------------------------------------------ {{{
let g:lightline= {
           \ 'colorscheme' : 'darcula'
          \ }
set noshowmode      " Uncomment to prevent non-normal modes showing in powerline and below powerline.
set statusline=         " Clear status line when vimrc is reloaded.
set statusline+=\ %F\ %M\ %Y\ %R " Status line left side.
set statusline+=%=      " Use a divider to separate the left side from the right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%    " Status line right side.
set laststatus=2        " Show the status on the second to last line.
" }}}
"PLUGINS 		---------- ---------- ---------- ---------- ---------- {{{
" vim-plug plugin manager is used

call plug#begin()

"{{ The Basics }}
    " Plug 'gmarik/Vundle.vim'                           " Vundle [DT]
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar [DT]
    
    Plug 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1

    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview [DT]
    Plug 'jiangmiao/auto-pairs'

"{{ File management }}
    " Plug 'vifm/vifm.vim'                               " Vifm [DT]
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree

"{{ Productivity }}
    " Plug 'vimwiki/vimwiki'                             " VimWiki [DT] 
    " Plug 'jreybert/vimagit'                            " Magit-like plugin for vim [DT]
    " Plug 'neoclide/coc-tabnine'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'mattn/emmet-vim'
    " let g:user_emmet_leader_key='<C->'
     
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks [DT]

"{{ Syntax Highlighting and Colors }}
    " Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting [DT]
    " Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting [DT]
    Plug 'vim-python/python-syntax'                    " Python highlighting [DT]
    Plug 'ap/vim-css-color'                            " Color previews for CSS [DT]
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/syntastic'
    Plug 'jbgutierrez/vim-better-comments'
    " Plug 'fatih/vim-go'
    
"{{ Junegunn Choi Plugins }}
    " Plug 'junegunn/goyo.vim'                           " Distraction-free viewing [dt]
    " Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range [dt]
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
    " Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    " xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    " nmap ga <Plug>(EasyAlign)
     
"{{Theme Plugins }}
    Plug 'ghifarit53/tokyonight-vim'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
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
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

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
" Themes 		---------- ---------- ---------- ---------- ---------- {{{

set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none
highlight WildMenu         ctermfg=0       ctermbg=80      cterm=none
highlight Folded           ctermfg=103     ctermbg=234     cterm=none
highlight FoldColumn       ctermfg=103     ctermbg=234     cterm=none
" highlight DiffAdd          ctermfg=none    ctermbg=23      cterm=none
" highlight DiffChange       ctermfg=none    ctermbg=56      cterm=none
" highlight DiffDelete       ctermfg=168     ctermbg=96      cterm=none
" highlight DiffText         ctermfg=0       ctermbg=80      cterm=none
" highlight SignColumn       ctermfg=244     ctermbg=235     cterm=none
" highlight Conceal          ctermfg=251     ctermbg=none    cterm=none
" highlight SpellBad         ctermfg=168     ctermbg=none    cterm=underline
" highlight SpellCap         ctermfg=80      ctermbg=none    cterm=underline
" highlight SpellRare        ctermfg=121     ctermbg=none    cterm=underline
" highlight SpellLocal       ctermfg=186     ctermbg=none    cterm=underline
" highlight Pmenu            ctermfg=251     ctermbg=234     cterm=none
" highlight PmenuSel         ctermfg=0       ctermbg=111     cterm=none
" highlight PmenuSbar        ctermfg=206     ctermbg=235     cterm=none
" highlight PmenuThumb       ctermfg=235     ctermbg=206     cterm=none
" highlight TabLine          ctermfg=244     ctermbg=234     cterm=none
" highlight TablineSel       ctermfg=0       ctermbg=247     cterm=none
" highlight TablineFill      ctermfg=244     ctermbg=234     cterm=none
" highlight CursorColumn     ctermfg=none    ctermbg=236     cterm=none
" highlight CursorLine       ctermfg=none    ctermbg=236     cterm=none
" highlight ColorColumn      ctermfg=none    ctermbg=236     cterm=none
" highlight Cursor           ctermfg=0       ctermbg=5       cterm=none
" highlight htmlEndTag       ctermfg=114     ctermbg=none    cterm=none
" highlight xmlEndTag        ctermfg=114     ctermbg=none    cterm=none
" }}}
