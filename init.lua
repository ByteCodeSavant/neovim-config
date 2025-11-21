-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.tmux_navigator_no_mappings = 1

-- Add Python bin directory to PATH for Jupyter tools
vim.env.PATH = "/Library/Frameworks/Python.framework/Versions/3.13/bin:" .. vim.env.PATH
