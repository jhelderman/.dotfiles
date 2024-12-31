return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    keys = {
      { "<leader>fe", "<cmd>Oil<cr>", desc = "Open Oil" },
    },
  },
}
