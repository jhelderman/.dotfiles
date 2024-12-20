local cmp = require("cmp")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'git' },
}, {
  { name = 'buffer' },
})
})
require("cmp_git").setup() ]]
--

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
	matching = { disallow_symbol_nonprefix_matching = false },
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig = require("lspconfig")
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
})
lspconfig.ruff.setup({
    capabilities = capabilities,
})
lspconfig.pylsp.setup({
	capabilities = capabilities,
	plugins = {
		-- jedi_completion = { enabled = true },
		-- jedi_hover = { enabled = true },
		-- jedi_references = { enabled = true },
		-- jedi_signature_help = { enabled = true },
		-- jedi_symbols = { enabled = true },
		-- jedi_document_highlight = { enabled = true },
		-- jedi_document_symbol = { enabled = true },
		-- jedi_workspace_symbols = { enabled = true },
		-- jedi_diagnostics = { enabled = true },
		-- jedi_rename = { enabled = true },
		-- jedi_code_actions = { enabled = true },
		-- jedi_code_lens = { enabled = true },
		-- jedi_definitions = { enabled = true },
		-- jedi_typing = { enabled = true },
		-- jedi_inlay_hints = { enabled = true },
		-- jedi_selection_range = { enabled = true },
		-- jedi_semantic_tokens = { enabled = true },
		-- jedi_semantic_highlight = { enabled = true },
		-- jedi_semantic_code_lens = { enabled = true },
		-- jedi_semantic_definitions = { enabled = true },
		pylint = { enabled = true },
	},
})
