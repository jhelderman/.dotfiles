return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/notes",
      },
    },
    daily_notes = {
      folder = "daily",
    },
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
  keys = {
    { "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "search obsidian files" },
    { "<leader>od", "<cmd>ObsidianToday<CR>", desc = "open daily note" },
    { "<leader>og", "<cmd>ObsidianSearch<CR>", desc = "grep obsidian files" },
    { "<leader>ox", "<cmd>ObsidianToggleCheckbox<CR>", desc = "toggle checkbox" },
    { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "new note" },
    { "<leader>ot", "<cmd>ObsidianTags<CR>", desc = "new note" },
  },
}
