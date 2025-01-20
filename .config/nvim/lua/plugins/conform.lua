return {
	"stevearc/conform.nvim",
	event = "BufWritePre", -- uncomment for format on save
	opts = {
		formatters_by_ft = {
			h = { " " },
			cpp = { "clang-format" },
			css = { "prettier" },
			go = { "golines", "goimports", "gofmt" },
			haskell = { "fourmolu" },
			html = { "prettier" },
			lua = { "stylua" },
			python = { "ruff_format", "isort" }, --"autoflake", "isort", "black" },
			-- python = { "autoflake", "isort", "black" },
			rust = { "rustfmt", lsp_format = "fallback" },
			json = { "clang-format" },
		},

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 1000000,
			lsp_fallback = false,
		},
	},
}
