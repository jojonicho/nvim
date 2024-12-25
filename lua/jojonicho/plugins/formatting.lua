return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				-- scss = {
				-- 	{
				-- 		command = "prettier",
				-- 		args = { "--config-precedence", "prefer-file", "--single-quote", "false", "--no-semi", "false" },
				-- 		stdin = true,
				-- 	},
				-- },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
				-- Exclude CSS from format on save
				-- filter = function(bufnr)
				-- 	-- Get the filetype of the buffer
				-- 	local ft = vim.bo[bufnr].filetype
				-- 	-- Return true for all filetypes except "css"
				-- 	return ft ~= "scss"
				-- end,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
