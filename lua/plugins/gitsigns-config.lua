-- Extends LazyVim's gitsigns setup; hunk keymaps live under <leader>gh (LazyVim defaults).
-- Line highlight colors are in colorscheme.lua.
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      current_line_blame_opts = { delay = 500 },
      current_line_blame_formatter = " <author> • <author_time:%Y-%m-%d> • <summary>",
    },
    keys = {
      {
        "<leader>gtb",
        function()
          require("gitsigns").toggle_current_line_blame()
        end,
        desc = "Toggle Blame",
      },
      {
        "<leader>gth",
        function()
          require("gitsigns").toggle_linehl()
        end,
        desc = "Toggle Line Highlights",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>gt", group = "toggle" },
      },
    },
  },
}
