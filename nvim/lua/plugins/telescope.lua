return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>sf", '<cmd>lua require("telescope.builtin").find_files()<CR>', desc = "Find Files" },
			{ "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<CR>', desc = "Git Files" },
			{ "<leader>sg", '<cmd>lua require("telescope.builtin").live_grep()<CR>', desc = "Live Grep" },
			{ "<leader>sb", '<cmd>lua require("telescope.builtin").buffers()<CR>', desc = "Search Buffers" },
			{ "<leader>sh", '<cmd>lua require("telescope.builtin").help_tags()<CR>', desc = "Search Help" },
		},
	},
}
