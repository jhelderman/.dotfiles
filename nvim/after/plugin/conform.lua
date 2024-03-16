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
  },
})

vim.keymap.set('n', '<leader>ft', require('conform').format, { desc = 'Format buffer' })
