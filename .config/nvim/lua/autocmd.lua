---------------------------------
--                             --
--    Auto Group / Auto CMD    --
--                             --
---------------------------------
local M = {}

---------------------------------
--        ==> Global <==       --
---------------------------------
vim.cmd([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
vim.cmd([[au BufWritePost * if search('\n\s*\%$', 'nw') | %s#\($\n\s*\)\+\%$## | exe "normal! \<C-o>" | endif]])

---------------------------------
--         ==> VIM <==         --
---------------------------------
vim.cmd([[
	autocmd FileType vim setlocal foldmethod=marker
	" Folding in VIM
	" ('zm' -> fold all | 'zr' -> unfold al)
	" This will enable code folding.
	" Use the marker method of folding.
	autocmd FileType vim set tabstop=8 shiftwidth=8 noexpandtab
]])

--- HTML ---
vim.cmd("autocmd Filetype html setlocal ts=2 sw=2 expandtab")

--- .clang-format ---
vim.cmd("autocmd BufNewFile,BufRead *.clang-format set filetype=yaml")

return M
