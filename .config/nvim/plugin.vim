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
	Plug 'airblade/vim-gitgutter'
	Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

"{{ Syntax Highlighting and Colors }}
	Plug 'PotatoesMaster/i3-vim-syntax'
	    				" i3 config highlighting.
	Plug 'baskerville/vim-sxhkdrc'	" sxhkd highlighting.
	Plug 'bfrg/vim-cpp-modern' 	" cpp better syntax highlighting
"{{ Language Support }}
	Plug 'vim-python/python-syntax'	" Python highlighting.
	Plug 'ap/vim-css-color'		" Color previews for CSS.
"{{Theme Plugins }}
" lualine
call plug#end()
