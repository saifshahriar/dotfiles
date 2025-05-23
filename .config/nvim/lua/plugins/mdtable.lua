return {
	"Kicamon/markdown-table-mode.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("markdown-table-mode").setup({
			filetype = {
				"*.md",
				"*.rmd",
			},
			options = {
				insert = true, -- when typeing "|"
				insert_leave = true, -- when leaving insert
			},
		})
	end,
}
