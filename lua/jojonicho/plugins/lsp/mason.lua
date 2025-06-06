return {
	-- { "mason-org/mason.nvim", version = "^1.0.0" },
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		-- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	-- "mason-org/mason.nvim",
	-- "mason-org/mason-lspconfig.nvim",
	-- "neovim/nvim-lspconfig",
	--   { "mason-org/mason.nvim", version = "^1.0.0" },
	-- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"rust_analyzer",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
			},
		})
	end,
}
