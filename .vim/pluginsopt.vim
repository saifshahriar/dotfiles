"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠'

"""------------------------------------------------------------
""" vim-gitgutter
"""------------------------------------------------------------
let g:gitgutter_map_keys = 0
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▌'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_removed_above_and_below = '▒'
let g:gitgutter_sign_modified_removed = '▌'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rustfmt
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd vimenter * NERDTree	" Uncomment to autostart the NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=25

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0		" Turns off auto preview
let g:instant_markdown_browser = "firefox"	" Uses firefox for preview

""""""""""
" ultisnip
""""""""""
let g:utiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>k"
let g:UltiSnipsEditSplit="vertical"

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
