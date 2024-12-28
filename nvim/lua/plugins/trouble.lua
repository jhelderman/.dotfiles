return {
	{
		"folke/trouble.nvim",
		keys = {
			{ "<leader>xx", "<cmd>lua require('trouble').toggle()<CR>", desc = "Trouble" },
			{
				"<leader>xw",
				"<cmd>lua require('trouble').toggle('workspace_diagnostics')<CR>",
				desc = "Trouble Workspace Diagnostics",
			},
			{
				"<leader>xd",
				"<cmd>lua require('trouble').toggle('document_diagnostics')<CR>",
				desc = "Trouble Document Diagnostics",
			},
			{ "<leader>xq", "<cmd>lua require('trouble').toggle('quickfix')<CR>", desc = "Trouble Quickfix" },
			{ "<leader>xl", "<cmd>lua require('trouble').toggle('loclist')<CR>", desc = "Trouble Loclist" },
			{ "gR", "<cmd>lua require('trouble').toggle('lsp_references')<CR>", desc = "Trouble LSP References" },
		},
	},
}
