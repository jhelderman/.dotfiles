return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    -- example using `opts` for defining servers
    opts = {
      servers = {
        lua_ls = {},
        pyright = {},
        rust_analyzer = {},
        gopls = {},
        -- pylsp = {
        --   plugins = {
        --     jedi_completion = { enabled = false },
        --     jedi_hover = { enabled = true },
        --     jedi_references = { enabled = true },
        --     jedi_signature_help = { enabled = true },
        --     jedi_symbols = { enabled = true, all_scopes = true },
        --     pycodestyle = { enabled = false },
        --     flake8 = { enabled = false },
        --     mypy = { enabled = false },
        --     isort = { enabled = false },
        --     yapf = { enabled = false },
        --     pylint = { enabled = false },
        --     pydocstyle = { enabled = false },
        --     mccabe = { enabled = false },
        --     preload = { enabled = false },
        --     rope_completion = { enabled = false },
        --   },
        -- },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
      -- go formatting and imports
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
    end,
  },
}
