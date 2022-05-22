" LEADER KEY: '\'

"""""""""""""""""""""""""""""""""
"	Special Mode		"
"""""""""""""""""""""""""""""""""
" Abbreviation Mode:
nnoremap <leader>a :a_

"""""""""""""""""""""""""""""""""
"	Basics			"
"""""""""""""""""""""""""""""""""
" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

nnoremap ; :
nnoremap ! :!
inoremap jj <Esc>
nnoremap e :e 

" Press \h to remove highlighting in search.
nnoremap <leader>h :nohl<Enter>

" Remove highlighting after a search.
nnoremap <Esc> <Esc>:nohl<Enter>

"""""""""""""""""""""""""""""""""
"	Auto Pairs		"
""""""""""""""""""""""""""""""""" NOTE: Keep this section commented if
				" vim-autopairs plugin is enabled.
" inoremap ( ()<LEFT>
" inoremap { {}<LEFT><Enter><Bs><Enter><Bs><Up><Tab>
" inoremap [ []<LEFT>
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>

"""""""""""""""""""""""""""""""""
" Always copy using "+y register"
""""""""""""""""""""""""""""""""" NOTE: gVim is needed.
vnoremap y "+y
nnoremap y "+y

"""""""""""""""""""""""""""""""""
"	Tabs			"
"""""""""""""""""""""""""""""""""
nnoremap <C-t> :tabnew<Enter>
nnoremap te :tabe 
nnoremap <Tab> :tabn<Enter>
nnoremap <S-Tab> :tabp<Enter>

"""""""""""""""""""""""""""""""""
"	Plugin Keybindings	"
"""""""""""""""""""""""""""""""""
"	=> NERDTree <=		"
"""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""
"	=> Instant Markdown <=	"
"""""""""""""""""""""""""""""""""
" Preview .md file
map <Leader>md :InstantMarkdownPreview<CR>
" Kills the preview
map <Leader>ms :InstantMarkdownStop<CR>
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
