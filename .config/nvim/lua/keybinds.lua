vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keybindings = {
	-- Basic
	{ "n", "<leader>a", ":a_",       desc = "Goto special abbreviation mode" },
	{ "n", ";",         ":",         desc = "Use ; instead of : for ease" },
	{ "i", "jj",        "<Esc>",     desc = "jj for quick esc" },
	{ "n", "<leader>h", ":nohl<CR>", desc = "Remove highlighting after search." },
	-- Easy commenting
	{ "n", "<leader>/", ":Commentary<CR>gcc", desc = "Comment current line with <Leader>/" },
	{ "v", "<leader>/", ":Commentary<CR>gv",  desc = "Comment selected block with <Leader>/" },
	-- Quick save and quit
	{ "n", "<leader>w",  ":w<CR>",   desc = "Quick save a buffer with <Leader>w" },
	{ "n", "<leader>q",  ":q<CR>",   desc = "Quick quit a buffer with <Leader>q" },
	{ "n", "<leader>wq", ":wq<CR>",  desc = "Quick save & quit a buffer with <Leader>wq" },
	-- Creating split panes
	{ "n", "<leader>v",  ":vs<CR>",  desc = "Vertical   split" },
	{ "n", "<leader>z",  ":sp<CR>",  desc = "Horizontal split" },
	-- Switching Panes
	{ "n", "<c-h>",     "<c-w>h", desc = "Goto Right pane" },
	{ "n", "<c-j>",     "<c-w>j", desc = "Goto Left  pane" },
	{ "n", "<c-k>",     "<c-w>k", desc = "Goto Up    pane" },
	{ "n", "<c-l>",     "<c-w>l", desc = "Goto Down  pane" },
	{ "n", "<c-Left>",  "<c-w>h", desc = "Goto Right pane" },
	{ "n", "<c-Down>",  "<c-w>j", desc = "Goto Left  pane" },
	{ "n", "<c-Up>",    "<c-w>k", desc = "Goto Up    pane" },
	{ "n", "<c-Right>", "<c-w>l", desc = "Goto Down  pane" },
	-- Easy Indent
	{ "n", ">", ">>"  },
	{ "n", "<", "<<"  },
	{ "v", "<", "<gv" },
	{ "v", ">", ">gv" },
	-- Copy across OS
	{ "n", "y", "\"+y", desc = "Always copy using \"+y register" },
	{ "v", "y", "\"+y", desc = "Always copy using \"+y register" },
}

for _, binding in ipairs(keybindings) do
	local mode, key, command, description = unpack(binding)
	vim.api.nvim_set_keymap(mode, key, command, { noremap = true, silent = false })
end

vim.cmd([[
"""""""""""""""""""""""""""""""""
"            For CP             "
"""""""""""""""""""""""""""""""""
autocmd FileType cpp noremap <F9> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< <CR>
autocmd FileType cpp noremap <F10> <ESC> :w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp<CR>
autocmd FileType cpp nested autocmd BufEnter */cp/* nested silent! execute 'noremap <F8> :0read ~/.vim/snippets/cp/cpp_template.cpp<CR>/int sol() {<CR>:nohl<CR>o'
]])
