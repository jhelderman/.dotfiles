return {
	-- the colorscheme should be available when starting Neovim
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd("colorscheme tokyonight")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
			vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
			vim.api.nvim_set_hl(0, "TroubleNormal", { bg = "none" })
		end,
	},

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
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" },
	{ "lewis6991/gitsigns.nvim" },
	{ "folke/todo-comments.nvim" },
	{ "jiangmiao/auto-pairs" },
	{ "vim-airline/vim-airline" },
	{ "vim-airline/vim-airline-themes" },
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
	{ "github/copilot.vim" },

	-- I have a separate config.mappings file where I require which-key.
	-- With lazy the plugin will be automatically loaded when it is required somewhere
	{ "folke/which-key.nvim" },

	{
		"nvim-neorg/neorg",
		-- lazy-load on filetype
		ft = "norg",
		-- options for neorg. This will automatically call `require("neorg").setup(opts)`
		opts = {
			load = {
				["core.defaults"] = {},
			},
		},
	},

	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		-- load cmp on InsertEnter
		event = "InsertEnter",
		-- these dependencies will only be loaded when cmp loads
		-- dependencies are always lazy-loaded unless specified otherwise
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
		},
	},

	-- if some code requires a module from an unloaded plugin, it will be automatically loaded.
	-- So for api plugins like devicons, we can always set lazy=true
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{ "folke/trouble.nvim" },
	{ "tpope/vim-surround" },
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
		},
	},
}
