-- .tmux.conf binds <C-h/j/k/l> to send those keys into nvim when the pane is
-- running vim (see ~/.local/bin/tmux-pane-has-vim); this plugin catches them and
-- moves between splits, falling through to tmux at the edges.
--
-- Managed by lazy.nvim rather than pack/plugins/start: lazy resets 'packpath'
-- (performance.reset_packpath), so packages in the config dir never load.
return {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to Left Window" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to Lower Window" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to Upper Window" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to Right Window" },
    { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to Previous Window" },
  },
}
