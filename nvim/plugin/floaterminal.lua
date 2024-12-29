local state = {
  floating = {
    buf = -1,
    win = -1,
  },
  cmd = "",
}

local function create_floating_window(opts)
  -- Get the screen dimensions
  local ui = vim.api.nvim_list_uis()[1]
  local width = math.floor(ui.width * 0.8)
  local height = math.floor(ui.height * 0.8)

  -- Calculate the starting position for the window
  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  -- Configure the floating window
  local window = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    border = "rounded",
  }

  -- Open the floating window
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- Create a non-listed, scratch buffer
  end
  local win = vim.api.nvim_open_win(buf, true, window)

  return { buf = buf, win = win }
end

local function toggle_floating_terminal()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_win_hide(state.floating.win)
  else
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  end
end

local run_python_script = function()
  local path = vim.fn.expand("%")
  local cmd = string.format("python %s", path)
  toggle_floating_terminal()
  local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  vim.fn.feedkeys("a" .. cmd .. enter)
end

local run_command = function(cmd)
  toggle_floating_terminal()
  local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
  vim.fn.feedkeys("a" .. cmd .. enter)
end

local update_command = function()
  vim.ui.input({ prompt = "Command: ", default = state.cmd, completion = "shellcmdline" }, function(input)
    if input ~= nil then
      state.cmd = input
    end
  end)
end

-- create user commands
vim.api.nvim_create_user_command("FloatingTerminal", toggle_floating_terminal, {})
vim.api.nvim_create_user_command("RunPythonScript", run_python_script, {})
vim.api.nvim_create_user_command("RunCommand", function()
  run_command(state.cmd)
end, {})
vim.api.nvim_create_user_command("UpdateCommand", update_command, {})

-- create keymaps
vim.keymap.set({ "n", "t" }, "<leader>tt", "<Cmd>FloatingTerminal<CR>", { desc = "Toggle Floating Terminal" })
vim.keymap.set("n", "<leader>tp", "<Cmd>RunPythonScript<CR>", { desc = "Run Python Script" })
vim.keymap.set("n", "<leader>tu", "<Cmd>UpdateCommand<CR>", { desc = "Update Floating Terminal Set Command" })
vim.keymap.set("n", "<leader>tr", "<Cmd>RunCommand<CR>", { desc = "Run Floating Terminal Set Command" })
