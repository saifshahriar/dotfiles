return {
	"neovim/nvim-lspconfig",
	config = function()
		require("nvchad.configs.lspconfig").defaults()
		local lspconfig = require "lspconfig"
		local servers = { "html", "cssls" }
		local nvlsp = require "nvchad.configs.lspconfig"
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup {
				on_attach = nvlsp.on_attach,
				on_init = nvlsp.on_init,
				capabilities = nvlsp.capabilities,
			}
		end
		-- user lsps
		lspconfig.clangd.setup {
			cmd = {
				"clangd",
				"--header-insertion=iwyu",
				"--header-insertion-decorators=0",
				"--clang-tidy",
			},
		}
		lspconfig.gopls.setup {}
		lspconfig.pylsp.setup { -- pip install pylsp-rope
			configurationSources = { "pycodestyle" }, -- "rope_completion" },
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							maxLineLength = 80,
						},
						-- rope_autoimport = {
						-- 	enabled = true,
						-- },
					},
				},
			},
		}
		lspconfig.rust_analyzer.setup {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						loadOutDirsFromCheck = true,
						allFeatures = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		}
		lspconfig.taplo.setup {} -- pip install pylsp-rope)
		lspconfig.jdtls.setup {}
	end,
}
