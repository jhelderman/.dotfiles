return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>rb", ":lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
      { "<leader>rc", ":lua require'dap'.continue()<cr>", desc = "Continue" },
      { "<F10>", ":lua require'dap'.step_over()<cr>", desc = "Step Over" },
      { "<leader>rs", ":lua require'dap'.step_into()<cr>", desc = "Step Into" },
      { "<F12>", ":lua require'dap'.step_out()<cr>", desc = "Step Out" },
      { "<leader>rl", ":lua require'dap'.run_last()<cr>", desc = "Run Last" },
      { "<leader>rr", ":lua require'dap'.repl.open()<cr>", desc = "Open Repl" },
      { "<leader>rq", ":lua require'dap'.close()<cr>", desc = "Stop" },
      { "<leader>rh", ":lua require'dap.ui.widgets'.hover()<cr>", desc = "Toggle Hover" },
      { "<leader>rp", ":lua require'dap.ui.widgets'.preview()<cr>", desc = "Toggle Hover" },
      {
        "<leader>rf",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.frames)
        end,
        desc = "Open Frames",
      },
      {
        "<leader>ro",
        function()
          local widgets = require("dap.ui.widgets")
          widgets.centered_float(widgets.scopes)
        end,
        desc = "Open Scopes",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python3")
    end,
  },
}
