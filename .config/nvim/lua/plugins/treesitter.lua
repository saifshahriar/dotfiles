return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_installed = { "c", 
				--"cpp",
				"lua", "vim", "vimdoc" },
				highlight = { enable = true },
				ident = { enable = true },
			})
		end
	}
}
