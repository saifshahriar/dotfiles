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

			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format", "isort" }
				else
					return { "autoflake", "isort", "black" }
				end
			end,

			rust = { "rustfmt", lsp_format = "fallback" },
			json = { "clang-format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			sql = { "sql-formatter" },
		},

		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 1000000,
			lsp_fallback = false,
		},
	},
}
