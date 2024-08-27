return {
	"nvim-lualine/lualine.nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				-- tabline = {
				-- 	  lualine_a = {'buffers'},
				-- 	  lualine_b = {'branch'},
				-- 	  lualine_c = {'filename'},
				-- },
				-- winbar = {
				-- 	lualine_a = {},
				-- 	lualine_b = {},
				-- 	lualine_c = {'filename'},
				-- 	lualine_x = {},
				-- 	lualine_y = {},
				-- 	lualine_z = {}
				-- }
			}
		})
	end
}
