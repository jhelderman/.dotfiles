local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "pyright", "rust_analyzer", "gopls", "clangd" },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- keybinds
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP get definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP get declaration' })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP get implementation' })
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, { desc = 'LSP go to type definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'LSP list references' })
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = 'LSP get signature help' })
vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = 'LSP rename' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP code action' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Open diagnostic float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- go
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

-- completion
local luasnip = require 'luasnip'
luasnip.config.setup {}
local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({ select = false }),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item({ behavior = 'insert' })
      else
        cmp.complete()
      end
    end),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
