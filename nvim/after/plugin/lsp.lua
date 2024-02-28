local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
end)

-- here you can setup the language servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"pyright", "rust_analyzer", "gopls", "clangd"},
  handlers = {
    lsp_zero.default_setup,
  },
})
