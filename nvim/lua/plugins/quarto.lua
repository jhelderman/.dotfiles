return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "r", "python", "rust" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      keymap = {
        -- NOTE: setup your own keymaps:
        hover = "K",
        definition = "<C-]>",
        rename = "grn",
        references = "gr",
        format = "<leader>gf",
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
    keys = {
-- local runner = require("quarto.runner")
    { "<leader>mc", "<cmd>lua require('quarto.runner').run_cell()<cr>", desc = "run cell", silent = true },
    { "<leader>ma", "<cmd>lua require('quarto.runner').run_above()<cr>", desc = "run cell and above", silent = true },
    { "<leader>mA", "<cmd>lua require('quarto.runner').run_all()<cr>", desc = "run all cells", silent = true },
    { "<leader>mm", "<cmd>lua require('quarto.runner').run_line()<cr>", desc = "run line", silent = true },
    { "<leader>m",  "<cmd>lua require('quarto.runner').run_range()<cr>", desc = "run visual range", silent = true, mode = "v" },
    { "<leader>MA", "<cmd>lua require('quarto.runner').run_all(true)", desc = "run all cells of all languages", silent = true },
    }
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
}
