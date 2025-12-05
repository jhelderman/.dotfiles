return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        pyright = {},
        rust_analyzer = {},
        gopls = {},
      },
    },
  },
}
