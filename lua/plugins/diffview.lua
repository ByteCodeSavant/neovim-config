return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gvh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
      { "<leader>gvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview Current File History" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = { spec = { { "<leader>gv", group = "diffview" } } },
  },
}
