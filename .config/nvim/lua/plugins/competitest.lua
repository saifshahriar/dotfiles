return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		vim.keymap.set("n", "<leader>cr", ":CompetiTest run<CR>", {})
		vim.keymap.set("n", "<leader>cs", ":CompetiTest show_ui<CR>", {})
		vim.keymap.set("n", "<leader>ct", ":CompetiTest receive testcases<CR>", {})
		vim.keymap.set("n", "<leader>cma", ":CompetiTest add_testcase<CR>", {})
		vim.keymap.set("n", "<leader>cme", ":CompetiTest edit_testcase<CR>", {})
		vim.keymap.set("n", "<leader>cmd", ":CompetiTest delete_testcase<CR>", {})
		vim.keymap.set("n", "<leader>cmd", ":CompetiTest delete_testcase<CR>", {})
		require("competitest").setup({
			runner_ui = { interface = "popup" },
			popup_ui = {
				total_width = 0.8,
				total_height = 0.8,
				layout = {
					{
						1,
						{
							{ 1, {
								{ 0.8, "tc" },
								{ 1, "si" },
							} },
							{ 1, "so" },
						},
					},
					{ 1, {
						{ 1, "se" },
						{ 1, "eo" },
					} },
				},
			},
			save_current_file = true,
			compile_directory = ".",
			compile_command = {
				cpp = {
					exec = "g++",
					args = {
						"-fsanitize=address",
						"-std=c++17",
						"-Wall",
						"-Wextra",
						"-Wshadow",
						"-O2",
						"-DONPC",
						"-DCIDE",
						"$(FNAME)",
						"-o",
						"$(FNOEXT)",
					},
				},
				rust = { exec = "rustc", args = { "$(FNAME)" } },
				java = { exec = "javac", args = { "$(FNAME)" } },
			},
			running_directory = ".",
			run_command = {
				c = { exec = "./$(FNOEXT)" },
				cpp = { exec = "./$(FNOEXT)" },
				rust = { exec = "./$(FNOEXT)" },
				python = { exec = "python3", args = { "$(FNAME)" } },
			},
			testcases_directory = "./testcases",
			testcases_input_file_format = "$(FNOEXT)_input_$(TCNUM).txt",
			testcases_output_file_format = "$(FNOEXT)_output_$(TCNUM).txt",
		})
	end,
	ft = { "c", "cpp", "python", "rust", "java" },
}
