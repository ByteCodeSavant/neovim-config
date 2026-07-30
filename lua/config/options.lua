-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.lazyvim_php_lsp = "intelephense" -- WordPress stubs support (default: phpactor)

opt.winbar = "%=%m %f" -- modified flag + file path in the window bar
opt.scrolloff = 8 -- lines of context above/below cursor (LazyVim: 4)
opt.updatetime = 250 -- CursorHold delay (LazyVim: 200)
