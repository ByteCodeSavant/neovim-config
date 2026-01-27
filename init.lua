-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Tmux Navigator Configuration
-- Disable default mappings (custom mappings defined via vim-tmux-navigator plugin in pack/)
-- Use <C-h/j/k/l> to navigate between tmux panes and vim splits seamlessly
vim.g.tmux_navigator_no_mappings = 1
