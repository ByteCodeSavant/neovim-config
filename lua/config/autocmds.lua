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
    -- Skip formatting for large files (>500KB)
    local max_filesize = 500 * 1024 -- 500KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > max_filesize then
      return
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
      conform.format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 3000 })
    end
  end,
})

-- Format Dart/Flutter files with dart format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.dart",
  callback = function()
    -- Skip formatting for large files (>500KB)
    local max_filesize = 500 * 1024 -- 500KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
    if ok and stats and stats.size > max_filesize then
      return
    end

    local conform_ok, conform = pcall(require, "conform")
    if conform_ok then
      conform.format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 3000 })
    end
  end,
})

-- Create a command for manual formatting with error handling
vim.api.nvim_create_user_command("Format", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ bufnr = vim.api.nvim_get_current_buf() })
  else
    vim.notify("conform.nvim not available", vim.log.levels.WARN)
  end
end, {})
