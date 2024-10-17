require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
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
})

vim.keymap.set("n", "<leader>ff", require("conform").format, { desc = "Format buffer" })
