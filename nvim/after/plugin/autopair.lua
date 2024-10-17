vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.rs" },
	command = "let b:AutoPairs = AutoPairsDefine({'w\zs<': '>'})",
	-- command = function(ev)
	-- 	vim.cmd("let b:AutoPairs = AutoPairsDefine({'w\zs<': '>'})")
	-- end,
})
