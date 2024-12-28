return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				go = { "goimports", "gofmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				rust = { "rustfmt" },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
			},
		},
		keys = {
			{ "<leader>ff", "<cmd>lua require('conform').format()<CR>", desc = "Format buffer" },
		},
	},
}
