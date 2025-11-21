return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
  keys = {
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    { "<leader>gdf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview Current File History" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
