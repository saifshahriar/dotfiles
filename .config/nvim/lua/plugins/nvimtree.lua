return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			-- open_on_setup = true,
			-- open_on_setup_file = true,
			-- ignore_buffer_on_setup = true,
			-- actions = {
			-- 	open_file = {
			-- 		resize_window = true,
			-- 	},
			-- },
			-- view = {
			-- 	relativenumber = true,
			-- },
		})
	end,
}
