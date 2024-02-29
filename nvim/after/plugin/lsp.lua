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
