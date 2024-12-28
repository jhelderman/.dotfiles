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
    end,
  },
}
