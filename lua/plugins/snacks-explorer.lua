return {
  "snacks.nvim",
  opts = {
    explorer = {
      -- Enable git integration to show file changes
      git = {
        enabled = true,
      },
      -- Show git status icons next to files
      icons = {
        git = {
          modified = "●",
          added = "+",
          deleted = "-",
          renamed = "→",
          untracked = "?",
          ignored = "◌",
          unstaged = "○",
          staged = "●",
          conflict = "!",
        },
      },
    },
  },
}
