return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- uncomment for format on save
	opts = {
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 1000000,
			lsp_fallback = false,
		},

		formatters_by_ft = {
			cpp = { "clang-format" },
			css = { "prettier" },
			go = { "golines", "goimports", "gofmt", "gofumpt" },
			h = { " " },
			haskell = { "fourmolu" },
			html = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "clang-format" },
			lua = { "stylua" },
			markdown = { "prettier_md" },

			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format", "isort" }
				else
					return { "autoflake", "isort", "black" }
				end
			end,

			rmd = { "prettier_md" },
			rust = { "rustfmt", lsp_format = "fallback" },
			sql = { "sql-formatter" },
			typst = { "prettypst" }, --"typstfmt" },
		},

		formatters = {
			prettier = {
				prepend_args = { "--print-width", "80", "--use-tabs", "--tab-width", "4" },
			},
			prettier_md = {
				command = "prettier",
				args = {
					"--no-config",
					"--print-width",
					"80",
					"--tab-width",
					"2",
					"--parser",
					"markdown",
					"--prose-wrap",
					"always",
				},
			},
			prettypst = {
				prepend_args = { "--style=otbs" },
			},
			rustfmt = {
				prepend_args = { "--config", "hard_tabs=true" },
			},
		},
	},
}
