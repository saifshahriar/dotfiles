" COMPATIBILITY 	---------- ---------- ---------- ---------- ---------- {{{
if has ('win32')
	set shell=pwsh	" Set pwsh as windows default shell
endif
set nocompatible	" Disable compatibility with VI which can cause unexpected error
			" ! Required [DT] => opp
" }}}
" Basic Configuration 	---------- ---------- ---------- ---------- ----------  {{{

set nu rnu
set nobackup		" Do not save backup files.

" Folding in VIM ('zm' -> fold | 'zr' -> unfold)
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
augroup filetype_lua
    autocmd!
    autocmd FileType lua setlocal foldmethod=indent
augroup END

set tabstop=4

" }}}
" Customized keybindings ---------- ---------- ---------- ---------- ---------- {{{
" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

" Press the ';' to go to type command in command mode.
noremap ; :
nnoremap ! :terminal 

" Remap ESC to jj to go to the command mode.
inoremap jj <Esc>

" e -> :e .
nnoremap e :e 

" tabs
nnoremap <C-t> :tabnew<Enter>
nnoremap te :tabe
nnoremap <Tab> :tabn<Enter>
nnoremap <S-Tab> :tabp<Enter>

" }}}
"PLUGINS 		---------- ---------- ---------- ---------- ---------- {{{
" All Plugins are managed through the 'vim-plug' manager.
" https://github.com/junegunn/vim-plug
call plug#begin()
" github copilot
    Plug 'github/copilot.vim'
"{{ The Basics }}
    Plug 'frazrepo/vim-rainbow'
    let g:rainbow_active = 1

    Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview [DT]

"{{ File management }}
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree

"{{ Productivity }}
    " Plug 'neoclide/coc-tabnine'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'mattn/emmet-vim'
    " let g:user_emmet_leader_key='<C->'
     
"{{ Tim Pope Plugins }}
    Plug 'tpope/vim-surround'                          " Change surrounding marks [DT]

"{{ Syntax Highlighting and Colors }}
    Plug 'ap/vim-css-color'                            " Color previews for CSS [DT]
    Plug 'dense-analysis/ale'
    Plug 'sheerun/vim-polyglot'
    Plug 'scrooloose/syntastic'
    Plug 'jbgutierrez/vim-better-comments'
    " Plug 'fatih/vim-go'
    
"{{ Junegunn Choi Plugins }}
    " Plug 'junegunn/goyo.vim'                           " Distraction-free viewing [dt]
    " Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range [dt]
    Plug 'junegunn/vim-emoji'				 " Vim needs emojis!
    " Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    " xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    " nmap ga <Plug>(EasyAlign)
     
"{{Theme Plugins }}
    Plug 'ghifarit53/tokyonight-vim'

call plug#end()

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
" }}}
