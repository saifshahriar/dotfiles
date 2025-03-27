--------------
-- AutoCMDs --
--------------
--
-- Define Groups
vim.api.nvim_create_augroup("compile", { clear = true })
vim.api.nvim_create_augroup("cp", { clear = true })

-- General AutoCMDs
vim.cmd([[
" Remember cursor position between sessions
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]])

-- Filetype AutoCMDs
--
-- C AutoCMDs
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "h", "c" },
	command = "set filetype=c",
})

-- C++ AutoCMDs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "hpp" },
	callback = function()
		vim.bo.commentstring = "/* %s */"
	end,
})

vim.api.nvim_create_autocmd("BufEnter", { -- Load CP template
	pattern = "*/cp/*",
	group = "cp",
	callback = function()
		vim.api.nvim_set_keymap(
			"n",
			"<F8>",
			":0read ~/.vim/snippets/cp/cpp_template.cpp<CR>/void sol() {<CR>:nohl<CR>o",
			{ noremap = true, silent = true }
		)
	end,
})

-- C/C++ AutoCMDs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "h", "hpp" },
	callback = function()
		vim.bo.commentstring = "/* %s */"
	end,
})

-- Markdown/Rmd AutoCMDs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "rmd" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.expandtab = true
		vim.opt_local.textwidth = 80
		vim.opt_local.formatoptions:append("t")
	end,
})

-- Vimscript AutoCMDs
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "vim", "vimrc" },
	callback = function()
		vim.bo.commentstring = '" %s'
	end,
})

-- vim.cmd([[
-- autocmd FileType rmd map <F5> :!echo<space>”require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
-- ]])
