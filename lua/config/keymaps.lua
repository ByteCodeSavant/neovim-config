-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Formatting keymaps with error handling
vim.keymap.set({ "n", "v" }, "<leader>cf", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = vim.api.nvim_get_current_buf() })
  else
    vim.notify("conform.nvim not available", vim.log.levels.WARN)
  end
end, { desc = "Format Buffer" })

vim.keymap.set({ "n", "v" }, "<leader>cF", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = vim.api.nvim_get_current_buf(), formatters = { "injected" } })
  else
    vim.notify("conform.nvim not available", vim.log.levels.WARN)
  end
end, { desc = "Format Injected Langs" })

-- Alternative formatting keybinds
vim.keymap.set({ "n", "v" }, "gq", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = vim.api.nvim_get_current_buf() })
  else
    vim.notify("conform.nvim not available", vim.log.levels.WARN)
  end
end, { desc = "Format Buffer" })

vim.keymap.set("n", "<leader>fm", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = vim.api.nvim_get_current_buf() })
  else
    vim.notify("conform.nvim not available", vim.log.levels.WARN)
  end
end, { desc = "Format Buffer" })

-- Git Telescope keymaps
vim.keymap.set("n", "<leader>gC", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gB", "<cmd>Telescope git_branches<cr>", { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gst", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", "<cmd>Telescope git_stash<cr>", { desc = "Git Stash" })
