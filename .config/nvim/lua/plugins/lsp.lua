return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        pyright = { mason = false },
        ruff = {},
        ty = {},
        rust_analyzer = {},
        gopls = {},
      },
    },
  },
}
