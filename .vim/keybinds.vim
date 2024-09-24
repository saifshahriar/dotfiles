" LEADER KEY: SPACE
let mapleader=" "
let maplocalleader=" "

"""""""""""""""""""""""""""""""""
"         Special Mode          "
"""""""""""""""""""""""""""""""""
" Abbreviation Mode: Goto special abbreviation mode
nnoremap <leader>a :a_

"""""""""""""""""""""""""""""""""
"            Basics             "
"""""""""""""""""""""""""""""""""
" nnoremap [ ,
" nnoremap ] ;
nnoremap ; :
nnoremap ! :!
inoremap jj <Esc>
noremap <TAB> %
nnoremap <leader>h :nohl<Enter>

" Easy commenting
nnoremap <leader>/ :Commentary<CR>gcc
vnoremap <leader>/ :Commentary<CR>gv

" Quick save && quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>

" creating pane
nnoremap <leader>v :vs<Enter>
nnoremap <leader>z :sp<Enter>

" Switching panes
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-Left> <c-w>h
nnoremap <c-Down> <c-w>j
nnoremap <c-Up> <c-w>k
nnoremap <c-Right> <c-w>l

" Indentation without breaking
nnoremap > >>
nnoremap < <<
vmap < <gv
vmap > >gv

"""""""""""""""""""""""""""""""""
" Always copy using "+y register"
""""""""""""""""""""""""""""""""" NOTE: gVim is needed.
vnoremap y "+y
nnoremap y "+y

"""""""""""""""""""""""""""""""""
"            For CP             "
"""""""""""""""""""""""""""""""""
autocmd FileType cpp noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
autocmd FileType cpp noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp<CR>
autocmd FileType cpp nested autocmd BufEnter */cp/* nested silent! execute 'noremap <F8> :0read ~/.vim/snippets/cp/cpp_template.cpp<CR>/int sol() {<CR>:nohl<CR>o'
autocmd FileType rust noremap <F10> <ESC> :w <CR> :!rustc --cfg feature=\"onpc\" % && ./%:r < inp<CR>
autocmd FileType rust nested autocmd BufEnter */cp/* nested silent! execute 'noremap <F8> :0read ~/.vim/snippets/cp/rust_template.rs<CR>/fn sol() -> usize {<CR>:nohl<CR>o'
"""""""""""""""""""""""""""""""""
"      Plugin Keybindings       "
"""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""
"       ==> NERDTree <==        "
"""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""
"   ==> Instant Markdown <==    "
"""""""""""""""""""""""""""""""""
" Preview .md file
map <Leader>md :InstantMarkdownPreview<CR>
" Kills the preview
map <Leader>ms :InstantMarkdownStop<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                    ==> Drag Visuals <==                     "
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
" vmap  <expr>  D        DVB_Duplicate()
"##
"##     " Remove any introduced trailing whitespace after moving...
" let g:DVB_TrimWS = 1
"##
"##  Or, if you use the arrow keys for normal motions, choose
"##  four other keys for block dragging. For example:
"##
" vmap  <expr>  h        DVB_Drag('left')
" vmap  <expr>  l        DVB_Drag('right')
" vmap  <expr>  j        DVB_Drag('down')
" vmap  <expr>  k        DVB_Drag('up')
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
