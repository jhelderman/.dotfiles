return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>rb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
      { "<leader>rc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
      { "<F10>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
      { "<leader>rs", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
      { "<F12>", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
      { "<leader>rl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Run Last" },
      { "<leader>rr", "<cmd>lua require'dap'.repl.open()<cr>", desc = "Open Repl" },
      { "<leader>rq", "<cmd>lua require'dap'.close()<cr>", desc = "Stop" },
      { "<leader>rh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", desc = "Toggle Hover" },
      { "<leader>rp", "<cmd>lua require'dap.ui.widgets'.preview()<cr>", desc = "Toggle Hover" },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>ro", "<cmd>lua require'dapui'.open()<cr>", desc = "Open DAP UI" },
      { "<leader>rd", "<cmd>lua require'dapui'.close()<cr>", desc = "Close DAP UI" },
    },
    config = function ()
      require("dapui").setup()
    end
  },
}
