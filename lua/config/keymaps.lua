-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Formatting: LazyVim already maps <leader>cf / <leader>cF via LazyVim.format.

-- Git pickers LazyVim doesn't map (it has gb/gB/gf/gg/gl already).
-- Letters picked to avoid gitsigns' buffer-local maps in gitsigns-config.lua:
-- gS = Stage Buffer, gd = Diff This, gB = Blame File.
vim.keymap.set("n", "<leader>gC", function() Snacks.picker.git_log() end, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gN", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gv", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gz", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
