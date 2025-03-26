require("nvchad.options")

-- add yours here!

local o = vim.opt
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.tabstop = 4
o.expandtab = false
o.shiftwidth = 4
o.smartindent = true
o.tabstop = 4
o.softtabstop = 4
o.numberwidth = 4
o.wrap = false
o.list = true
o.spell = true
o.spellfile = "~/.config/nvim/spell/en.utf-8.add"
o.colorcolumn = "80"
o.scrolloff = 16 -- Do not let cursor scroll below or above N lines when scrolling.
o.sidescrolloff = 8 -- Same for side scrolling.
o.listchars:append({ tab = "│ ", trail = "" })
o.foldmethod = "marker"

vim.api.nvim_create_augroup("SetTextWidth", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "SetTextWidth",
	pattern = { "markdown", "text" },
	callback = function()
		vim.opt_local.textwidth = 80
	end,
})
