"""""""""""""""""""""""""""""""""
"				"
"	Plugins			"
"				"
"""""""""""""""""""""""""""""""""
"	Local Plugins		"
"""""""""""""""""""""""""""""""""
" Damian Conway's Plugins
source $HOME/.vim/plugins/dragvisuals.vim
source $HOME/.vim/plugins/commentary.vim


"""""""""""""""""""""""""""""""""
" 	Vim Plug		"
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugins/vim-plug/plugged')

"{{ The Basics }}
	Plug 'frazrepo/vim-rainbow'
	let g:rainbow_active = 1
	" Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
					" Markdown Preview
	Plug 'jiangmiao/auto-pairs'     " Brackates and quote autopairs.
	Plug 'tpope/vim-surround'	" Changes surrounding characters.

"{{ File management }}
	Plug 'saifshahriar/vim-startify'
                                        " Startpage for vim.
	" Plug 'vifm/vifm.vim'		" Vifm
	" Plug 'scrooloose/nerdtree'	" Nerdtree
	" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
					" Highlighting Nerdtree
	" Plug 'ryanoasis/vim-devicons'	" Icons for Nerdtree

"{{ Productivity }}
	" Plug 'vimwiki/vimwiki'	" VimWiki
	" Plug 'jreybert/vimagit'	" Magit-like plugin for vim
	" Plug 'neoclide/coc-tabnine'   " Tabnine code autocompletion.
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'mattn/emmet-vim'        " Emmet snippets.
	" let g:user_emmet_leader_key='<C->'
	Plug 'airblade/vim-gitgutter'

"{{ Syntax Highlighting and Colors }}
	Plug 'PotatoesMaster/i3-vim-syntax'
	    				" i3 config highlighting.
	Plug 'baskerville/vim-sxhkdrc'	" sxhkd highlighting.
"{{ Language Support }}
	Plug 'vim-python/python-syntax'	" Python highlighting.
	Plug 'ap/vim-css-color'		" Color previews for CSS.
	" Plug 'dense-analysis/ale'
	" Plug 'sheerun/vim-polyglot'
	Plug 'jbgutierrez/vim-better-comments'
                                        " Better comments for vim.
	" Plug 'fatih/vim-go'             " Golang syntax highlighting.

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
	" Plug 'itchyny/lightline.vim'	" Lightline     statusbar. # Keep only
	Plug 'vim-airline/vim-airline'  " Airline       statusbar. # one of them
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ghifarit53/tokyonight-vim'
	" Plug 'gruvbox-community/gruvbox'
call plug#end()
