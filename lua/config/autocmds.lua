-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Format Python files with black on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
  end,
})

-- Format Dart/Flutter files with dart format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.dart",
  callback = function()
    require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
  end,
})

-- Create a command for manual formatting
vim.api.nvim_create_user_command("Format", function()
  require("conform").format({ bufnr = vim.api.nvim_get_current_buf() })
end, {})
